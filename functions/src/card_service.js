import {HttpsError} from 'firebase-functions/v2/https';

// Stripe is injected so tests can use a local HTTP provider without credentials.
export function cardService({db,stripe,readCart,now=Date.now}) {
  const quoteRef=id=>db.doc(`CheckoutQuotes/${id}`);
  async function owned(uid,id) {
    const doc=await quoteRef(id).get();
    if(!doc.exists || doc.data().userId!==uid) throw new HttpsError('permission-denied','Quote unavailable.');
    return doc.data();
  }
  async function reserve(uid,id) {
    await db.runTransaction(async tx=>{
      const ref=quoteRef(id),doc=await tx.get(ref);
      if(!doc.exists || doc.data().userId!==uid) throw new HttpsError('permission-denied','Quote unavailable.');
      const q=doc.data();
      if(q.cardReserved) return;
      if(q.used || q.expiresAt<=now()) throw new HttpsError('failed-precondition','Review your total.');
      const {priced}=await readCart(tx,uid,q.cartId,q.addressId);
      if(q.fingerprint!==priced.fingerprint) throw new HttpsError('failed-precondition','Your cart changed.');
      tx.update(ref,{cardReserved:true,cardStartedAt:now()});
      tx.update(db.doc(`CartDB/${q.cartId}`),{checkoutQuoteId:id});
    });
  }
  async function intent(uid,id) {
    const q=await owned(uid,id);
    if(!q.cardReserved) throw new HttpsError('failed-precondition','Payment not reserved.');
    if(q.intentId) return stripe.paymentIntents.retrieve(q.intentId);
    // Stripe can prune idempotency keys after 24h. Never risk a second charge.
    if(now()-q.cardStartedAt>23*60*60*1000) throw new HttpsError('unavailable','Payment reconciliation required.');
    const pi=await stripe.paymentIntents.create({amount:q.totalMinor,currency:q.currency.toLowerCase(),
      payment_method_types:['card'],metadata:{quoteId:id,userId:uid}}, {idempotencyKey:`bite-card-${id}`});
    await db.runTransaction(async tx=>{
      const current=await tx.get(quoteRef(id));
      if(current.data().intentId && current.data().intentId!==pi.id) throw new Error('intent mismatch');
      tx.update(quoteRef(id),{intentId:pi.id});
    });
    return pi;
  }
  async function settle(pi) {
    const id=pi.metadata?.quoteId;
    if(typeof id!=='string' || id.includes('/')) throw new Error('invalid metadata');
    return db.runTransaction(async tx=>{
      const ref=quoteRef(id),doc=await tx.get(ref);
      if(!doc.exists) throw new Error('missing quote');
      const q=doc.data();
      if(!q.cardReserved || pi.metadata.userId!==q.userId || (q.intentId && q.intentId!==pi.id) ||
        pi.amount!==q.totalMinor || pi.currency!==q.currency.toLowerCase()) throw new Error('payment mismatch');
      const orderRef=db.doc(`OrdersDB/${id}`),order=await tx.get(orderRef);
      if(order.exists) return {orderId:id,status:'succeeded'};
      const cartRef=db.doc(`CartDB/${q.cartId}`),cart=await tx.get(cartRef);
      if(pi.status==='canceled') {
        tx.update(ref,{used:true,intentId:pi.id,paymentStatus:'canceled'});
        if(cart.data()?.checkoutQuoteId===id) tx.update(cartRef,{checkoutQuoteId:null});
        return {status:'canceled'};
      }
      if(pi.status!=='succeeded') return {status:pi.status};
      if(pi.amount_received!==q.totalMinor || q.paymentStatus==='canceled') throw new Error('payment mismatch');
      // Snapshot was validated at reservation. Subsequent catalog changes cannot orphan a paid order.
      const lines=await tx.get(cartRef.collection('Products'));
      tx.create(orderRef,{orderId:id,userId:q.userId,restaurantId:q.restaurantId,cartID:q.cartId,
        totalPrice:q.totalMinor/100,totalMinor:q.totalMinor,currency:q.currency,
        deliveryAddressId:q.addressId,deliveryAddress:q.deliveryAddress,paymentMethod:'card',
        paymentProvider:'stripe',paymentIntentId:pi.id,orderStatus:'received',isPaid:true,
        orderPlacedAt:new Date(now()).toISOString(),orderDeliveredAt:null});
      for(const item of q.items) tx.create(orderRef.collection('Items').doc(item.lineID),item);
      // Rules prevent edits while reserved. Retain unexpected lines defensively.
      for(const line of lines.docs) {
        const item=q.items.find(i=>i.lineID===line.id),data=line.data();
        if(item && data.productID===item.productID && data.quantity===item.quantity &&
          (data.selectedSize??'')===(item.selectedSize??'') &&
          JSON.stringify([...new Set(data.selectedFlavors??(data.selectedFlavor?data.selectedFlavor.split(', '):[]))].sort())===JSON.stringify(item.selectedFlavors??[])) tx.delete(line.ref);
      }
      tx.update(ref,{used:true,intentId:pi.id,orderId:id,paymentStatus:'succeeded'});
      if(cart.data()?.checkoutQuoteId===id) tx.update(cartRef,{checkoutQuoteId:null});
      return {orderId:id,status:'succeeded'};
    });
  }
  return {
    async prepare(uid,id) {
      await reserve(uid,id);
      const pi=await intent(uid,id),result=await settle(pi);
      return {...result,clientSecret:result.orderId || result.status==='canceled' ? null : pi.client_secret};
    },
    async complete(uid,id) {return settle(await intent(uid,id));},
    async cancel(uid,id) {
      let pi=await intent(uid,id);
      if(pi.status!=='succeeded' && pi.status!=='canceled') {
        try {pi=await stripe.paymentIntents.cancel(pi.id);}
        catch {pi=await stripe.paymentIntents.retrieve(pi.id);}
      }
      return settle(pi);
    },
    settle,
  };
}
