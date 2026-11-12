abstract interface class CardPaymentGateway {
  bool get available;
  Future<String?> pay(String quoteId);
  Future<String?> cancel(String quoteId);
}
