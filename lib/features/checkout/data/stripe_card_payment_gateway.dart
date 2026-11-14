import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../domain/card_payment_gateway.dart';
import '../domain/checkout_repository.dart';
import 'package:bite_food_delivery/app/constants/stripe_const.dart';

class StripeCardPaymentGateway implements CardPaymentGateway {
  const StripeCardPaymentGateway(this.functions);
  final FirebaseFunctions functions;
  @override
  bool get available =>
      stripePublishableKey.isNotEmpty &&
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);
  Future<Map<String, dynamic>> _call(String name, String id) async {
    try {
      final result = await functions.httpsCallable(name).call({'quoteId': id});
      return Map<String, dynamic>.from(result.data as Map);
    } on FirebaseFunctionsException catch (e) {
      throw CheckoutFailure(stale: e.code == 'failed-precondition');
    }
  }

  String? _order(Map<String, dynamic> data) {
    final id = data['orderId'];
    if (data['status'] == 'succeeded' && id is String && id.isNotEmpty) {
      return id;
    }
    if (data['status'] == 'canceled') return null;
    throw const CheckoutFailure();
  }

  @override
  Future<String?> pay(String quoteId) async {
    if (!available) throw const CheckoutFailure();
    final prepared = await _call('prepareCardPayment', quoteId);
    if (prepared['status'] == 'succeeded' || prepared['status'] == 'canceled') {
      return _order(prepared);
    }
    if (prepared['status'] == 'processing') throw const CheckoutFailure();
    final secret = prepared['clientSecret'];
    if (secret is! String || secret.isEmpty) throw const CheckoutFailure();
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: secret,
          merchantDisplayName: 'Bite',
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) return cancel(quoteId);
      rethrow;
    }
    return _order(await _call('completeCardPayment', quoteId));
  }

  @override
  Future<String?> cancel(String quoteId) async =>
      _order(await _call('cancelCardPayment', quoteId));
}
