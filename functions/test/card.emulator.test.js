import test from 'node:test';
import assert from 'node:assert/strict';
import {createServer} from 'node:http';
import Stripe from 'stripe';
import {db,readCart} from '../src/checkout_core.js';
import {quoteCart,placeCashOrder,stripeWebhook} from '../src/index.js';
import {cardService} from '../src/card_service.js';
const enabled=Boolean(process.env.FIRESTORE_EMULATOR_HOST);
if(enabled && (!process.env.GCLOUD_PROJECT?.startsWith('demo-') || !/^(127\.0\.0\.1|localhost):/.test(process.env.FIRESTORE_EMULATOR_HOST))) throw new Error('Local demo emulator required');
let sequence=0;
async function fixture(t) {
 const uid=`card-${Date.now()}-${++sequence}`,foodId=`food-${uid}`,restaurantId=`r-${uid}`;
 await db.doc(`CartDB/${uid}`).set({cartID:uid,userID:uid});
 await db.doc(`CartDB/${uid}/Products/line`).set({productID:foodId,quantity:1,selectedSize:'',selectedFlavors:[]});
 await db.doc(`UsersDB/${uid}/addresses/home`).set({street:'Street',city:'City',country:'PK',userID:uid});
 await db.doc(`FoodItemsDB/${foodId}`).set({id:foodId,RestuarantId:restaurantId,price:100,isAvailable:true});
 await db.doc(`RestaurantsDB/${restaurantId}`).set({id:restaurantId,isOpen:true,deliveryFee:10});
 const request={auth:{uid},data:{cartId:uid,addressId:'home',requestId:'00000000-0000-4000-8000-000000000001'}};
 const q=await quoteCart.run(request);
 const intents=new Map(),keys=new Map(),calls=[];
 let failNext=false;
 const server=createServer(async(req,res)=>{
   let raw=''; for await(const chunk of req)raw+=chunk;
   calls.push({path:req.url,key:req.headers['idempotency-key'],body:raw});
   if(failNext){failNext=false;res.writeHead(503,{'Content-Type':'application/json'});res.end(JSON.stringify({error:{message:'Unavailable',type:'api_error'}}));return;}
   let pi;
   if(req.method==='POST' && req.url==='/v1/payment_intents'){
     const key=req.headers['idempotency-key'];pi=keys.get(key);
     if(!pi){const p=new URLSearchParams(raw);pi={id:`pi_${intents.size+1}`,object:'payment_intent',amount:Number(p.get('amount')),currency:p.get('currency'),amount_received:0,status:'requires_payment_method',client_secret:'pi_local_secret_mock',metadata:{quoteId:p.get('metadata[quoteId]'),userId:p.get('metadata[userId]')}};keys.set(key,pi);intents.set(pi.id,pi);}
   } else {const id=req.url.split('/')[3];pi=intents.get(id);if(req.url.endsWith('/cancel') && pi?.status!=='succeeded')pi.status='canceled';}
   res.writeHead(pi?200:501,{'Content-Type':'application/json'});res.end(JSON.stringify(pi??{error:{message:'Not mocked'}}));
 });
 await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve));t.after(()=>new Promise(resolve=>server.close(resolve)));
 const stripe=new Stripe('sk_test_local_fake',{host:'127.0.0.1',port:server.address().port,protocol:'http',maxNetworkRetries:0});
 const service=cardService({db,stripe,readCart});
 return {uid,q,request,service,intents,calls,fail:()=>{failNext=true;}};
}
const options={skip:!enabled};
test('card HTTP flow uses server totals, survives retries and fulfills only verified payment',options,async t=>{
 const f=await fixture(t);
 const [a,b]=await Promise.all([f.service.prepare(f.uid,f.q.quoteId),f.service.prepare(f.uid,f.q.quoteId)]);
 assert.equal(a.clientSecret,b.clientSecret);assert.equal(f.intents.size,1);
 const pi=[...f.intents.values()][0];assert.equal(pi.amount,13000);assert.equal(pi.currency,'pkr');
 assert.equal((await db.doc(`OrdersDB/${f.q.quoteId}`).get()).exists,false);
 await assert.rejects(placeCashOrder.run({auth:{uid:f.uid},data:{quoteId:f.q.quoteId}}));
 assert.equal((await quoteCart.run(f.request)).cardPending,true);
 await assert.rejects(f.service.complete('someone-else',f.q.quoteId));
 pi.status='succeeded';pi.amount_received=13000;
 const results=await Promise.all([f.service.complete(f.uid,f.q.quoteId),f.service.settle({...pi})]);
 assert.equal(results[0].orderId,results[1].orderId);
 assert.equal((await db.doc(`OrdersDB/${f.q.quoteId}`).get()).data().isPaid,true);
 assert.equal((await db.collection(`CartDB/${f.uid}/Products`).get()).size,0);
 assert.equal((await db.doc(`CartDB/${f.uid}`).get()).data().checkoutQuoteId,null);
 assert.equal((await f.service.cancel(f.uid,f.q.quoteId)).orderId,f.q.quoteId);
});
test('provider outage retains reservation; retry cancels safely without deleting cart',options,async t=>{
 const f=await fixture(t);f.fail();await assert.rejects(f.service.prepare(f.uid,f.q.quoteId));
 assert.equal((await db.doc(`CartDB/${f.uid}`).get()).data().checkoutQuoteId,f.q.quoteId);
 await f.service.prepare(f.uid,f.q.quoteId);
 assert.equal((await f.service.cancel(f.uid,f.q.quoteId)).status,'canceled');
 assert.equal((await db.collection(`CartDB/${f.uid}/Products`).get()).size,1);
 assert.equal((await db.doc(`OrdersDB/${f.q.quoteId}`).get()).exists,false);
 assert.equal((await db.doc(`CartDB/${f.uid}`).get()).data().checkoutQuoteId,null);
});
test('mismatched amounts cannot fulfill; unknown intent after retention window never recreates',options,async t=>{
 const f=await fixture(t);await f.service.prepare(f.uid,f.q.quoteId);
 const pi=[...f.intents.values()][0];
 await assert.rejects(f.service.settle({...pi,status:'succeeded',amount_received:1}));
 await assert.rejects(f.service.settle({...pi,status:'succeeded',amount:1,amount_received:1}));
 await db.doc(`CheckoutQuotes/${f.q.quoteId}`).update({intentId:null,cardStartedAt:0});
 const count=f.calls.length;await assert.rejects(f.service.prepare(f.uid,f.q.quoteId));assert.equal(f.calls.length,count);
});
test('unsigned webhook is rejected before database access',async()=>{
 process.env.STRIPE_SECRET_KEY='sk_test_local_fake';process.env.STRIPE_WEBHOOK_SECRET='whsec_local_fake';
 let status;
 const res={status(code){status=code;return this;},send(){},sendStatus(code){status=code;}};
 await stripeWebhook({method:'POST',rawBody:Buffer.from('{}'),headers:{}},res);
 assert.equal(status,400);
});
