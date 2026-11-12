import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/features/cart/domain/cart_repository.dart';
import 'package:bite_food_delivery/features/cart/models/cart_model.dart';
import 'package:bite_food_delivery/features/cart/models/cart_item_model.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/checkout/domain/checkout_repository.dart';
import 'package:bite_food_delivery/features/checkout/models/checkout_quote.dart';
import 'support/catalog_fixtures.dart';

const cartLine = CartItemModel(
  productID: 'dish',
  lineID: 'variant-large',
  product: dish,
  quantity: 2,
  selectedSize: 'Large',
);
CartModel fixtureCart([String user = 'user']) =>
    CartModel(cartID: 'cart', userID: user, cartItems: const [cartLine]);

class ControlledCart implements CartRepository {
  final streams = <String, StreamController<CartModel?>>{};
  final calls = <({String user, String line, int expected, int quantity})>[];
  bool fails = false;
  Completer<void>? pending;
  @override
  Stream<CartModel?> watch(String userId) => streams
      .putIfAbsent(userId, () => StreamController<CartModel?>.broadcast())
      .stream;
  @override
  Future<void> setQuantity({
    required String userId,
    required String cartId,
    required String lineId,
    required int expectedQuantity,
    required int quantity,
  }) async {
    calls.add((
      user: userId,
      line: lineId,
      expected: expectedQuantity,
      quantity: quantity,
    ));
    if (fails) throw StateError('network');
    await pending?.future;
  }

  Future<void> close() async {
    for (final stream in streams.values) {
      await stream.close();
    }
  }
}

class FakeCheckout implements CheckoutRepository {
  int reviews = 0, placements = 0;
  bool fails = false, stale = false;
  Completer<CheckoutQuote>? pendingQuote;
  Completer<String>? pendingOrder;
  String? lastQuote;
  CheckoutQuote result = CheckoutQuote(
    id: 'quote',
    currency: 'PKR',
    subtotalMinor: 105100,
    deliveryMinor: 10000,
    platformFeeMinor: 2000,
    totalMinor: 117100,
    expiresAt: DateTime(2030),
  );
  @override
  Future<CheckoutQuote> quote({
    required String cartId,
    required String addressId,
    required String requestId,
  }) async {
    reviews++;
    if (fails) throw const CheckoutFailure();
    return pendingQuote == null ? result : pendingQuote!.future;
  }

  @override
  Future<String> placeCashOrder(String quoteId) async {
    placements++;
    lastQuote = quoteId;
    if (fails) throw CheckoutFailure(stale: stale);
    return pendingOrder == null ? 'order' : pendingOrder!.future;
  }
}

Future<void> tick() => Future<void>.delayed(Duration.zero);
void main() {
  test(
    'cart writes use variant line ID, suppress repeats and preserve items on failure',
    () async {
      final repo = ControlledCart();
      final c = CartCubit(repo);
      addTearDown(repo.close);
      addTearDown(c.close);
      c.initialize('user');
      repo.streams['user']!.add(fixtureCart());
      await tick();
      repo.pending = Completer<void>();
      final change = c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: 3),
      );
      await c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: 3),
      );
      expect(repo.calls, hasLength(1));
      expect(repo.calls.single.line, 'variant-large');
      expect(repo.calls.single.expected, 2);
      expect((c.state as CartLoaded).pending, {'variant-large'});
      repo.pending!.complete();
      await change;
      repo.fails = true;
      await c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: 3),
      );
      expect((c.state as CartLoaded).cartItems, [cartLine]);
      expect((c.state as CartLoaded).failed, true);
      expect((c.state as CartLoaded).pending, isEmpty);
      expect((c.state as CartLoaded).validForCheckout, false);
    },
  );
  test(
    'cart clears on account change and ignores late previous-account operations',
    () async {
      final repo = ControlledCart();
      final c = CartCubit(repo);
      addTearDown(repo.close);
      addTearDown(c.close);
      c.initialize('user');
      repo.streams['user']!.add(fixtureCart());
      await tick();
      repo.pending = Completer<void>();
      final pending = c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: 3),
      );
      c.initialize('other');
      expect(c.state, isA<CartLoading>());
      repo.streams['user']!.add(fixtureCart());
      repo.streams['other']!.add(null);
      repo.pending!.complete();
      await pending;
      await tick();
      expect(c.state, isA<CartEmpty>());
      c.clearSession();
      expect(c.userId, isNull);
    },
  );
  test(
    'quantity limits and wrong cart identity never reach repository',
    () async {
      final repo = ControlledCart();
      final c = CartCubit(repo);
      addTearDown(repo.close);
      addTearDown(c.close);
      c.initialize('user');
      repo.streams['user']!.add(fixtureCart());
      await tick();
      await c.updateCartItem(
        cartID: 'wrong',
        cartItem: cartLine.copyWith(quantity: 3),
      );
      await c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: 100),
      );
      await c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: -1),
      );
      expect(repo.calls, isEmpty);
      await c.updateCartItem(
        cartID: 'cart',
        cartItem: cartLine.copyWith(quantity: 0),
      );
      expect(repo.calls.single.quantity, 0);
      repo.streams['user']!.add(null);
      await tick();
      expect(c.state, isA<CartEmpty>());
    },
  );
  test(
    'checkout eligibility rejects mixed restaurants, unavailable items and pending changes',
    () {
      expect(CartLoaded(cart: fixtureCart()).validForCheckout, true);
      expect(
        CartLoaded(
          cart: fixtureCart(),
          pending: {'variant-large'},
        ).validForCheckout,
        false,
      );
      expect(
        CartLoaded(
          cart: fixtureCart().copyWith(
            cartItems: [
              cartLine,
              cartLine.copyWith(product: dish.copyWith(restaurantId: 'other')),
            ],
          ),
        ).validForCheckout,
        false,
      );
      expect(
        CartLoaded(
          cart: fixtureCart().copyWith(
            cartItems: [
              cartLine.copyWith(product: dish.copyWith(isAvailable: false)),
            ],
          ),
        ).validForCheckout,
        false,
      );
    },
  );
  test(
    'quote decode preserves minor units and rejects inconsistent totals',
    () {
      final data = {
        'quoteId': 'quote',
        'currency': 'PKR',
        'subtotalMinor': 105100,
        'deliveryMinor': 10000,
        'platformFeeMinor': 2000,
        'totalMinor': 117100,
        'expiresAt': 1893456000000,
      };
      expect(CheckoutQuote.fromJson(data).totalMinor, 117100);
      expect(
        () => CheckoutQuote.fromJson({...data, 'totalMinor': 1}),
        throwsFormatException,
      );
      expect(
        () => CheckoutQuote.fromJson({...data, 'currency': 'USD'}),
        throwsFormatException,
      );
    },
  );
  test(
    'quote requests coalesce and stale in-flight quotes cannot overwrite changed inputs',
    () async {
      final repo = FakeCheckout()..pendingQuote = Completer<CheckoutQuote>();
      final c = CheckoutCubit(repo);
      addTearDown(c.close);
      final pending = c.review('cart', 'address');
      await c.review('cart', 'address');
      expect(repo.reviews, 1);
      c.invalidate();
      repo.pendingQuote!.complete(repo.result);
      await pending;
      expect(c.state.quote, isNull);
      expect(c.state.busy, false);
    },
  );
  test(
    'placement retries the same quote and never submits twice concurrently',
    () async {
      final repo = FakeCheckout();
      final c = CheckoutCubit(repo);
      addTearDown(c.close);
      await c.review('cart', 'address');
      repo.fails = true;
      await c.place();
      expect(c.state.failed, true);
      expect(c.state.quote!.id, 'quote');
      repo.fails = false;
      repo.pendingOrder = Completer<String>();
      final placing = c.place();
      await c.place();
      expect(repo.placements, 2);
      expect(repo.lastQuote, 'quote');
      c.invalidate();
      expect(c.state.placing, true);
      repo.pendingOrder!.complete('order');
      await placing;
      expect(c.state.orderId, 'order');
      await c.place();
      expect(repo.placements, 2);
    },
  );
  test('expired and rejected quotes require review before ordering', () async {
    final repo = FakeCheckout();
    final c = CheckoutCubit(repo, now: () => DateTime(2031));
    addTearDown(c.close);
    await c.review('cart', 'address');
    await c.place();
    expect(c.state.stale, true);
    expect(repo.placements, 0);
    final second = CheckoutCubit(repo);
    addTearDown(second.close);
    await second.review('cart', 'address');
    repo.fails = true;
    repo.stale = true;
    await second.place();
    expect(second.state.stale, true);
    expect(second.state.quote, isNull);
  });
  test(
    'an uncertain placement can reconcile after cart changes and expiry',
    () async {
      final repo = FakeCheckout();
      var clock = DateTime(2029);
      final c = CheckoutCubit(repo, now: () => clock);
      addTearDown(c.close);
      await c.review('cart', 'address');
      repo.fails = true;
      await c.place();
      c.invalidate();
      expect(c.state.quote!.id, 'quote');
      clock = DateTime(2031);
      repo.fails = false;
      await c.place();
      expect(c.state.orderId, 'order');
      expect(repo.lastQuote, 'quote');
    },
  );
  test('closing while placing an order is safe', () async {
    final repo = FakeCheckout()..pendingOrder = Completer<String>();
    final c = CheckoutCubit(repo);
    await c.review('cart', 'address');
    final pending = c.place();
    await c.close();
    repo.pendingOrder!.complete('order');
    await pending;
  });
}
