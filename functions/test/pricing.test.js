import test from 'node:test';
import assert from 'node:assert/strict';
import {minorUnits,priceCart} from '../src/pricing.js';
const food={id:'food',name:'Burger',RestuarantId:'restaurant',price:525.50,isAvailable:true,sizes:['Large'],flavors:{'Hot, sweet':''}};
const line={lineID:'line',productID:'food',quantity:2,selectedSize:'Large',selectedFlavors:['Hot, sweet'],product:{price:1}};
function fixture(){return {lines:[line],foods:new Map([['food',food]]),restaurant:{id:'restaurant',isOpen:true,deliveryFee:100},address:{addressID:'home',street:'Street',city:'City',country:'PK'},platformFeeMinor:2000};}
test('prices come from catalog, in exact minor units and one currency',()=>{
 const quote=priceCart(fixture());assert.equal(quote.subtotalMinor,105100);assert.equal(quote.totalMinor,117100);assert.equal(quote.currency,'PKR');
 assert.deepEqual(quote.items[0].selectedFlavors,['Hot, sweet']);
});
test('money rejects invalid precision, negatives, infinity and unsafe amounts',()=>{
 for(const price of [-1,NaN,Infinity,1.005,1e-10,Number.MAX_SAFE_INTEGER])assert.throws(()=>minorUnits(price));
 assert.equal(minorUnits(0.29),29);assert.equal(minorUnits(525.5),52550);
});
test('closed, missing, mixed restaurant, unavailable and invalid options are rejected',()=>{
 const changes=[f=>f.restaurant.isOpen=false,f=>f.foods.clear(),f=>f.foods.set('food',{...food,RestuarantId:'other'}),
 f=>f.foods.set('food',{...food,isAvailable:false}),f=>f.lines=[{...line,selectedSize:'Unknown'}],f=>f.lines=[{...line,selectedFlavors:['Unknown']}],
 f=>f.lines=[{...line,quantity:0}],f=>f.lines=[{...line,quantity:100}],f=>f.lines=[{...line,quantity:1.5}],f=>f.address.street='',f=>f.lines=[]];
 for(const change of changes){const f=fixture();change(f);assert.throws(()=>priceCart(f));}
});
test('fingerprint changes for quantity, address, options, fees and prices',()=>{
 const original=priceCart(fixture()).fingerprint;
 for(const change of [f=>f.lines=[{...line,quantity:3}],f=>f.address.street='Other',f=>f.lines=[{...line,selectedFlavors:[]}],f=>f.platformFeeMinor=3000,f=>f.foods.set('food',{...food,price:526})]){
 const f=fixture();change(f);assert.notEqual(priceCart(f).fingerprint,original);}
});
