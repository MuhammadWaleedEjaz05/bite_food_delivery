class CheckoutQuote {
  const CheckoutQuote({
    required this.id,
    this.cardPending = false,
    this.deliveryAddress,
    required this.currency,
    required this.subtotalMinor,
    required this.deliveryMinor,
    required this.platformFeeMinor,
    required this.totalMinor,
    required this.expiresAt,
  });
  final String id, currency;
  final bool cardPending;
  final String? deliveryAddress;
  final int subtotalMinor, deliveryMinor, platformFeeMinor, totalMinor;
  final DateTime expiresAt;
  factory CheckoutQuote.fromJson(Map<String, dynamic> json) {
    final q = CheckoutQuote(
      id: json['quoteId'] as String,
      cardPending: json['cardPending'] == true,
      deliveryAddress: json['deliveryAddress'] is Map
          ? [
              'street',
              'city',
              'country',
            ].map((key) => json['deliveryAddress'][key] ?? '').join(', ')
          : null,
      currency: json['currency'] as String,
      subtotalMinor: json['subtotalMinor'] as int,
      deliveryMinor: json['deliveryMinor'] as int,
      platformFeeMinor: json['platformFeeMinor'] as int,
      totalMinor: json['totalMinor'] as int,
      expiresAt: DateTime.fromMillisecondsSinceEpoch(json['expiresAt'] as int),
    );
    if (q.id.isEmpty ||
        q.currency != 'PKR' ||
        q.subtotalMinor < 0 ||
        q.deliveryMinor < 0 ||
        q.platformFeeMinor < 0 ||
        q.totalMinor <= 0 ||
        q.totalMinor !=
            q.subtotalMinor + q.deliveryMinor + q.platformFeeMinor) {
      throw const FormatException('Invalid quote');
    }
    return q;
  }
}
