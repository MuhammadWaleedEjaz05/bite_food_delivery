import {onCall,HttpsError} from 'firebase-functions/v2/https';
import {db,auth,id,safe,readCart,options,publicQuote} from './checkout_core.js';
export const quoteCart=onCall(options,request=>safe(async()=>{
  const uid=auth(request);
  const cartId=id(request.data?.cartId), addressId=id(request.data?.addressId), requestId=id(request.data?.requestId);
  if(!/^[0-9a-f-]{36}$/i.test(requestId)) throw new HttpsError('invalid-argument','Invalid request identifier.');
  const pendingCart=await db.doc(`CartDB/${cartId}`).get();
  if(pendingCart.data()?.userID===uid && pendingCart.data()?.checkoutQuoteId) {
    const pending=await db.doc(`CheckoutQuotes/${pendingCart.data().checkoutQuoteId}`).get();
    if(pending.exists && pending.data().userId===uid && pending.data().cardReserved && !pending.data().used) return publicQuote(pending.id,pending.data());
    throw new HttpsError('failed-precondition','Payment reconciliation required.');
  }
  const quoteId=`${uid}_${requestId}`;
  return db.runTransaction(async tx=>{
    const quoteRef=db.collection('CheckoutQuotes').doc(quoteId);
    const existing=await tx.get(quoteRef);
    const {priced}=await readCart(tx,uid,cartId,addressId);
    if(existing.exists) {
      const q=existing.data();
      if(q.userId!==uid || q.cartId!==cartId || q.addressId!==addressId ||
        q.fingerprint!==priced.fingerprint || q.expiresAt<=Date.now() || q.used) {
        throw new HttpsError('failed-precondition','Refresh your checkout total.');
      }
      return publicQuote(quoteId,q);
    }
    const q={...priced,userId:uid,cartId,addressId,expiresAt:Date.now()+5*60*1000,used:false};
    tx.create(quoteRef,q);
    return publicQuote(quoteId,q);
  });
}));
export const placeCashOrder=onCall(options,request=>safe(async()=>{
  const uid=auth(request), quoteId=id(request.data?.quoteId);
  return db.runTransaction(async tx=>{
    const quoteRef=db.collection('CheckoutQuotes').doc(quoteId);
    const orderRef=db.collection('OrdersDB').doc(quoteId);
    const quote=await tx.get(quoteRef);
    if(!quote.exists || quote.data().userId!==uid) throw new HttpsError('permission-denied','Quote unavailable.');
    const q=quote.data();
    const existing=await tx.get(orderRef);
    // A lost response can be retried safely even after the cart was cleared.
    if(existing.exists) {
      if(existing.data().userId!==uid) throw new HttpsError('permission-denied','Order unavailable.');
      return {orderId:orderRef.id};
    }
    if(q.used || q.cardReserved || q.expiresAt<=Date.now()) throw new HttpsError('failed-precondition','Refresh your checkout total.');
    const {priced,refs}=await readCart(tx,uid,q.cartId,q.addressId);
    if(priced.fingerprint!==q.fingerprint) throw new HttpsError('failed-precondition','Your cart or prices changed.');
    const order={orderId:orderRef.id,userId:uid,restaurantId:priced.restaurantId,cartID:q.cartId,
      totalPrice:priced.totalMinor/100,totalMinor:priced.totalMinor,currency:priced.currency,
      deliveryAddressId:q.addressId,deliveryAddress:priced.deliveryAddress,paymentMethod:'onCash',
      orderStatus:'received',isPaid:false,orderPlacedAt:new Date().toISOString(),orderDeliveredAt:null};
    tx.create(orderRef,order);
    for(const item of priced.items) {
      tx.create(orderRef.collection('Items').doc(item.lineID),item);
    }
    for(const ref of refs) tx.delete(ref);
    tx.update(quoteRef,{used:true,orderId:orderRef.id});
    return {orderId:orderRef.id};
  });
}));

export {prepareCardPayment,completeCardPayment,cancelCardPayment,stripeWebhook} from './payments.js';
