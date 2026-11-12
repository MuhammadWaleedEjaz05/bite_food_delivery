import test from 'node:test';
import assert from 'node:assert/strict';
import {getFirestore} from 'firebase-admin/firestore';
import {quoteCart,placeCashOrder} from '../src/index.js';
const enabled=Boolean(process.env.FIRESTORE_EMULATOR_HOST);
if(enabled && (!process.env.GCLOUD_PROJECT?.startsWith('demo-') || !/^(127\.0\.0\.1|localhost):/.test(process.env.FIRESTORE_EMULATOR_HOST))) throw new Error('Tests require a local demo emulator');
const db=getFirestore();
let sequence=0;
async function seed(){
 const uid=`test-${Date.now()}-${++sequence}`;
 const cartId=uid;const foodId=`food-${uid}`;const restaurantId=`restaurant-${uid}`;
 await db.doc(`UsersDB/${uid}/addresses/home`).set({userID:uid,street:'Street',city:'City',country:'PK'});
 await db.doc(`RestaurantsDB/${restaurantId}`).set({id:restaurantId,name:'Kitchen',isOpen:true,deliveryFee:100});
 await db.doc(`FoodItemsDB/${foodId}`).set({id:foodId,RestuarantId:restaurantId,name:'Burger',price:525.5,sizes:['Large'],flavors:{},isAvailable:true});
 await db.doc(`CartDB/${cartId}`).set({userID:uid});
 await db.doc(`CartDB/${cartId}/Products/line`).set({productID:foodId,quantity:2,selectedSize:'Large',product:{price:1}});
 const request={auth:{uid},data:{cartId,addressId:'home',requestId:'00000000-0000-4000-8000-000000000001'}};
 return {uid,cartId,foodId,restaurantId,request};
}
const opts={skip:!enabled};
test('authenticated quote ignores forged totals and cash placement is idempotent',opts,async()=>{
 const f=await seed();f.request.data.totalMinor=1;
 const quote=await quoteCart.run(f.request);
 assert.equal(quote.totalMinor,117100);
 const retry=await quoteCart.run(f.request);assert.equal(retry.quoteId,quote.quoteId);
 const request={auth:{uid:f.uid},data:{quoteId:quote.quoteId}};
 const [a,b]=await Promise.all([placeCashOrder.run(request),placeCashOrder.run(request)]);
 assert.equal(a.orderId,b.orderId);
 const order=(await db.doc(`OrdersDB/${a.orderId}`).get()).data();
 assert.equal(order.totalPrice,1171);assert.equal(order.isPaid,false);assert.equal(order.paymentMethod,'onCash');
 assert.equal((await db.collection(`OrdersDB/${a.orderId}/Items`).get()).size,1);
 assert.equal((await db.collection(`CartDB/${f.cartId}/Products`).get()).size,0);
 assert.equal((await placeCashOrder.run(request)).orderId,a.orderId);
});
test('guest and cross-owner requests are rejected',opts,async()=>{
 const f=await seed();
 await assert.rejects(quoteCart.run({data:f.request.data}),e=>e.code==='unauthenticated');
 await assert.rejects(quoteCart.run({...f.request,auth:{uid:'other'}}),e=>e.code==='permission-denied');
 const quote=await quoteCart.run(f.request);
 await assert.rejects(placeCashOrder.run({auth:{uid:'other'},data:{quoteId:quote.quoteId}}),e=>e.code==='permission-denied');
});
test('price and quantity changes require a new quote and leave the cart intact',opts,async()=>{
 for(const change of ['price','quantity']){
  const f=await seed();const quote=await quoteCart.run(f.request);
  if(change==='price')await db.doc(`FoodItemsDB/${f.foodId}`).update({price:600});
  else await db.doc(`CartDB/${f.cartId}/Products/line`).update({quantity:3});
  await assert.rejects(placeCashOrder.run({auth:{uid:f.uid},data:{quoteId:quote.quoteId}}),e=>e.code==='failed-precondition');
  assert.equal((await db.doc(`OrdersDB/${quote.quoteId}`).get()).exists,false);
  assert.equal((await db.collection(`CartDB/${f.cartId}/Products`).get()).size,1);
 }
});
test('expired quotes cannot create an order',opts,async()=>{
 const f=await seed();const quote=await quoteCart.run(f.request);
 await db.doc(`CheckoutQuotes/${quote.quoteId}`).update({expiresAt:0});
 await assert.rejects(placeCashOrder.run({auth:{uid:f.uid},data:{quoteId:quote.quoteId}}),e=>e.code==='failed-precondition');
});
