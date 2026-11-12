import Stripe from 'stripe';
import {onCall,onRequest} from 'firebase-functions/v2/https';
import {defineSecret} from 'firebase-functions/params';
import {db,auth,id,safe,readCart,options} from './checkout_core.js';
import {cardService} from './card_service.js';
const secret=defineSecret('STRIPE_SECRET_KEY');
const signingSecret=defineSecret('STRIPE_WEBHOOK_SECRET');
const client=()=>new Stripe(secret.value(),{maxNetworkRetries:2,timeout:20000});
const service=()=>cardService({db,stripe:client(),readCart});
const callableOptions={...options,secrets:[secret]};
export const prepareCardPayment=onCall(callableOptions,r=>safe(()=>service().prepare(auth(r),id(r.data?.quoteId))));
export const completeCardPayment=onCall(callableOptions,r=>safe(()=>service().complete(auth(r),id(r.data?.quoteId))));
export const cancelCardPayment=onCall(callableOptions,r=>safe(()=>service().cancel(auth(r),id(r.data?.quoteId))));
export const stripeWebhook=onRequest({...options,secrets:[secret,signingSecret]},async(req,res)=>{
  if(req.method!=='POST') {res.sendStatus(405);return;}
  let event;
  try {event=client().webhooks.constructEvent(req.rawBody,req.headers['stripe-signature'],signingSecret.value());}
  catch {res.status(400).send('Invalid signature');return;}
  if(!['payment_intent.succeeded','payment_intent.canceled'].includes(event.type)) {res.sendStatus(200);return;}
  // Ignore unrelated payments on the same Stripe account.
  if(!event.data.object.metadata?.quoteId) {res.sendStatus(200);return;}
  try {await service().settle(event.data.object);res.sendStatus(200);}
  catch {res.status(500).send('Reconciliation pending');}
});
