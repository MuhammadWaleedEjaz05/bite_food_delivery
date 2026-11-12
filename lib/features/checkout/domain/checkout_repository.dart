import '../models/checkout_quote.dart';

class CheckoutFailure implements Exception {
  const CheckoutFailure({this.stale = false});
  final bool stale;
}

abstract interface class CheckoutRepository {
  Future<CheckoutQuote> quote({
    required String cartId,
    required String addressId,
    required String requestId,
  });
  Future<String> placeCashOrder(String quoteId);
}
