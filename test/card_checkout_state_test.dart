import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:bite_food_delivery/features/checkout/bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/features/checkout/domain/card_payment_gateway.dart';
import 'package:bite_food_delivery/features/checkout/domain/checkout_repository.dart';
import 'commerce_state_test.dart';

class FakeCards implements CardPaymentGateway {
  @override
  bool get available => true;
  final calls = <String>[];
  Completer<String?>? pending;
  bool fails = false;
  String? result = 'paid-order';
  @override
  Future<String?> pay(String quoteId) async {
    calls.add(quoteId);
    if (fails) throw const CheckoutFailure();
    return pending == null ? result : pending!.future;
  }

  @override
  Future<String?> cancel(String quoteId) async => result;
}

void main() {
  test(
    'card submission singleflight blocks cash and preserves reservation on cart changes',
    () async {
      final repository = FakeCheckout();
      final cards = FakeCards()..pending = Completer();
      final c = CheckoutCubit(repository, cards: cards);
      await c.review('cart', 'home');
      final pending = c.payCard();
      await c.payCard();
      await c.place();
      c.invalidate();
      expect(cards.calls, ['quote']);
      expect(repository.placements, 0);
      expect(c.state.cardPending, true);
      cards.pending!.complete('paid-order');
      await pending;
      expect(c.state.orderId, 'paid-order');
      await c.close();
    },
  );
  test(
    'uncertain card response retries same quote and cannot switch to cash',
    () async {
      final repository = FakeCheckout();
      final cards = FakeCards()..fails = true;
      final c = CheckoutCubit(repository, cards: cards);
      await c.review('cart', 'home');
      await c.payCard();
      c.invalidate();
      await c.place();
      expect(repository.placements, 0);
      expect(c.state.failed, true);
      cards.fails = false;
      await c.payCard();
      expect(cards.calls, ['quote', 'quote']);
      expect(c.state.orderId, 'paid-order');
      await c.close();
    },
  );
  test(
    'verified cancellation clears quote while a concurrent successful charge adopts order',
    () async {
      final cards = FakeCards()..result = null;
      final c = CheckoutCubit(FakeCheckout(), cards: cards);
      await c.review('cart', 'home');
      await c.payCard(cancel: true);
      expect(c.state.quote, null);
      await c.review('cart', 'home');
      cards.result = 'paid-order';
      await c.payCard(cancel: true);
      expect(c.state.orderId, 'paid-order');
      await c.close();
    },
  );
  test(
    'late payment completion after navigation does not emit on closed cubit',
    () async {
      final cards = FakeCards()..pending = Completer();
      final c = CheckoutCubit(FakeCheckout(), cards: cards);
      await c.review('cart', 'home');
      final pending = c.payCard();
      await c.close();
      cards.pending!.complete('paid-order');
      await pending;
    },
  );
}
