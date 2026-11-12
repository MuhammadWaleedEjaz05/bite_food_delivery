import {createHash} from 'node:crypto';

export class CheckoutError extends Error {
  constructor(code) { super(code); this.code = code; }
}
function requireValue(value, code) { if (!value) throw new CheckoutError(code); }
export function minorUnits(value) {
  requireValue(typeof value === 'number' && Number.isFinite(value) && value >= 0, 'invalid-price');
  const text = String(value);
  requireValue(/^\d+(\.\d{1,2})?$/.test(text), 'invalid-price');
  const [whole, fraction = ''] = text.split('.');
  const amount = Number(whole) * 100 + Number(fraction.padEnd(2, '0'));
  requireValue(Number.isSafeInteger(amount), 'invalid-price');
  return amount;
}
export function priceCart({lines, foods, restaurant, address, platformFeeMinor}) {
  requireValue(lines.length > 0 && lines.length <= 100, 'invalid-cart');
  requireValue(restaurant?.isOpen === true, 'restaurant-closed');
  requireValue(address && ['street','city','country'].every(key => typeof address[key] === 'string' && address[key].trim()), 'invalid-address');
  requireValue(Number.isSafeInteger(platformFeeMinor) && platformFeeMinor >= 0, 'invalid-fee');
  const items = lines.map(line => {
    const food = foods.get(line.productID);
    requireValue(food && food.isAvailable !== false, 'item-unavailable');
    requireValue(food.RestuarantId === restaurant.id, 'mixed-restaurants');
    requireValue(Number.isInteger(line.quantity) && line.quantity >= 1 && line.quantity <= 99, 'invalid-quantity');
    const size = line.selectedSize ?? '';
    const sizes = food.sizes ?? [];
    requireValue(sizes.length === 0 ? size === '' : sizes.includes(size), 'invalid-options');
    const flavors = [...new Set(line.selectedFlavors ?? (line.selectedFlavor ? line.selectedFlavor.split(', ') : []))].sort();
    requireValue(flavors.every(flavor => Object.hasOwn(food.flavors ?? {}, flavor)), 'invalid-options');
    const unitMinor = minorUnits(food.price);
    return {lineID: line.lineID, productID: line.productID, quantity: line.quantity,
      selectedSize: size, selectedFlavors: flavors, selectedFlavor: flavors.join(', '),
      product: food, unitMinor, totalMinor: unitMinor * line.quantity};
  }).sort((a,b) => a.lineID.localeCompare(b.lineID));
  const subtotalMinor = items.reduce((sum,line) => sum + line.totalMinor, 0);
  const deliveryMinor = minorUnits(restaurant.deliveryFee);
  const totalMinor = subtotalMinor + deliveryMinor + platformFeeMinor;
  requireValue(Number.isSafeInteger(totalMinor) && totalMinor > 0 && totalMinor <= 99999999, 'invalid-total');
  const deliveryAddress = Object.fromEntries(['addressID','label','street','city','zipCode','country'].map(key => [key,address[key] ?? '']));
  const fingerprint = createHash('sha256').update(JSON.stringify({
    items: items.map(({product, ...line}) => ({...line, restaurantId: product.RestuarantId})),
    deliveryAddress, deliveryMinor, platformFeeMinor,
  })).digest('hex');
  return {currency:'PKR', items, restaurantId:restaurant.id, deliveryAddress,
    subtotalMinor, deliveryMinor, platformFeeMinor, totalMinor, fingerprint};
}
