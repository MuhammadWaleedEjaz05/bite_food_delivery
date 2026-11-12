part of 'checkout_cubit.dart';

class CheckoutState {
  const CheckoutState({
    this.quote,
    this.cardPending = false,
    this.reviewing = false,
    this.placing = false,
    this.failed = false,
    this.stale = false,
    this.orderId,
  });
  final CheckoutQuote? quote;
  final bool reviewing, placing, failed, stale, cardPending;
  final String? orderId;
  bool get busy => reviewing || placing;
}
