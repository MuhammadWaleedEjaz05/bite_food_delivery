import {initializeApp} from 'firebase-admin/app';
import {getFirestore} from 'firebase-admin/firestore';
import {onCall,HttpsError} from 'firebase-functions/v2/https';
import {defineInt} from 'firebase-functions/params';
import {priceCart,CheckoutError} from './pricing.js';
initializeApp();
const db = getFirestore();
// Matches the existing fee, but is now controlled by deployment configuration.
const platformFee = defineInt('PLATFORM_FEE_MINOR', {default:2000});
const options = {region:'us-central1',maxInstances:10};
function auth(request) {
  if (!request.auth) throw new HttpsError('unauthenticated','Sign in to continue.');
  return request.auth.uid;
}
function id(value) {
  if (typeof value !== 'string' || !value.length || value.length > 200 || value.includes('/')) {
    throw new HttpsError('invalid-argument','Invalid identifier.');
  }
  return value;
}
async function catalog(tx,collection,businessId) {
  const ref = db.collection(collection);
  const query = await tx.get(ref.where('id','==',businessId).limit(1));
  const doc = query.docs[0] ?? await tx.get(ref.doc(id(businessId)));
  if (!doc.exists) throw new HttpsError('failed-precondition','Catalog item unavailable.');
  return {...doc.data(), id:doc.data().id ?? doc.id};
}
async function readCart(tx,uid,cartId,addressId) {
  const cartRef=db.collection('CartDB').doc(cartId);
  const cart=await tx.get(cartRef);
  if (!cart.exists || cart.data().userID !== uid) throw new HttpsError('permission-denied','Cart unavailable.');
  if (cart.data().checkoutQuoteId) throw new HttpsError('failed-precondition','Resume or cancel your pending card payment.');
  const addressDoc=await tx.get(db.collection('UsersDB').doc(uid).collection('addresses').doc(addressId));
  if (!addressDoc.exists) throw new HttpsError('failed-precondition','Select a delivery address.');
  const snapshot=await tx.get(cartRef.collection('Products').limit(101));
  if (snapshot.empty || snapshot.size > 100) throw new HttpsError('failed-precondition','Review your cart.');
  const lines=snapshot.docs.map(doc=>({...doc.data(),lineID:doc.id}));
  const foods=new Map();
  for (const line of lines) {
    if (!foods.has(line.productID)) foods.set(line.productID,await catalog(tx,'FoodItemsDB',id(line.productID)));
  }
  const restaurant=await catalog(tx,'RestaurantsDB',id(foods.get(lines[0].productID).RestuarantId));
  const priced=priceCart({lines,foods,restaurant,address:{...addressDoc.data(),addressID:addressId},platformFeeMinor:process.env.PLATFORM_FEE_MINOR === undefined ? 2000 : platformFee.value()});
  return {priced, refs:snapshot.docs.map(doc=>doc.ref)};
}
function publicQuote(quoteId,q) {
  return {quoteId,deliveryAddress:q.deliveryAddress,cardPending:q.cardReserved===true,currency:q.currency,subtotalMinor:q.subtotalMinor,deliveryMinor:q.deliveryMinor,
    platformFeeMinor:q.platformFeeMinor,totalMinor:q.totalMinor,expiresAt:q.cardReserved ? Date.now()+5*60*1000 : q.expiresAt};
}
async function safe(action) {
  try { return await action(); }
  catch(error) {
    if(error instanceof HttpsError) throw error;
    if(error instanceof CheckoutError) throw new HttpsError('failed-precondition',error.code);
    // Do not return stack traces, catalog documents or credentials to clients.
    throw new HttpsError('internal','Checkout could not be completed.');
  }
}

export {db,auth,id,safe,readCart,options,publicQuote};
