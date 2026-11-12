import 'package:cloud_functions/cloud_functions.dart';
import '../domain/checkout_repository.dart';
import '../models/checkout_quote.dart';

class FirebaseCheckoutRepository implements CheckoutRepository {
  const FirebaseCheckoutRepository(this.functions);
  final FirebaseFunctions functions;
  Future<Map<String, dynamic>> _call(
    String name,
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await functions
          .httpsCallable(name)
          .call<Map<String, dynamic>>(data);
      return Map<String, dynamic>.from(result.data);
    } on FirebaseFunctionsException catch (e) {
      throw CheckoutFailure(stale: e.code == 'failed-precondition');
    }
  }

  @override
  Future<CheckoutQuote> quote({
    required String cartId,
    required String addressId,
    required String requestId,
  }) async => CheckoutQuote.fromJson(
    await _call('quoteCart', {
      'cartId': cartId,
      'addressId': addressId,
      'requestId': requestId,
    }),
  );
  @override
  Future<String> placeCashOrder(String quoteId) async {
    final id = (await _call('placeCashOrder', {'quoteId': quoteId}))['orderId'];
    if (id is! String || id.isEmpty) throw const CheckoutFailure();
    return id;
  }
}
