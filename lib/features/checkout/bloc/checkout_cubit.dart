import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../domain/card_payment_gateway.dart';
import '../domain/checkout_repository.dart';
import '../models/checkout_quote.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.repository, {DateTime Function()? now, this.cards})
    : now = now ?? DateTime.now,
      super(const CheckoutState());
  final CheckoutRepository repository;
  final CardPaymentGateway? cards;
  bool get cardsAvailable => cards?.available ?? false;
  final DateTime Function() now;
  int _generation = 0;
  void invalidate() {
    if (isClosed ||
        state.placing ||
        state.cardPending ||
        (state.orderId != null || (state.failed && state.quote != null))) {
      return;
    }
    ++_generation;
    emit(const CheckoutState());
  }

  Future<void> review(String cartId, String addressId) async {
    if (isClosed || state.busy || state.orderId != null) return;
    final generation = ++_generation;
    emit(const CheckoutState(reviewing: true));
    try {
      final quote = await repository.quote(
        cartId: cartId,
        addressId: addressId,
        requestId: const Uuid().v4(),
      );
      if (!isClosed && generation == _generation) {
        emit(CheckoutState(quote: quote, cardPending: quote.cardPending));
      }
    } catch (_) {
      if (!isClosed && generation == _generation) {
        emit(const CheckoutState(failed: true));
      }
    }
  }

  Future<void> place() async {
    final quote = state.quote;
    if (isClosed ||
        state.busy ||
        state.cardPending ||
        state.orderId != null ||
        quote == null) {
      return;
    }
    if (!state.failed && !now().isBefore(quote.expiresAt)) {
      emit(const CheckoutState(stale: true));
      return;
    }
    emit(CheckoutState(quote: quote, placing: true));
    try {
      final id = await repository.placeCashOrder(quote.id);
      if (!isClosed) emit(CheckoutState(quote: quote, orderId: id));
    } catch (e) {
      if (!isClosed) {
        emit(
          e is CheckoutFailure && e.stale
              ? const CheckoutState(stale: true)
              : CheckoutState(quote: quote, failed: true),
        );
      }
    }
  }

  Future<void> payCard({bool cancel = false}) async {
    final quote = state.quote;
    if (isClosed ||
        state.busy ||
        state.orderId != null ||
        quote == null ||
        cards == null) {
      return;
    }
    emit(CheckoutState(quote: quote, placing: true, cardPending: true));
    try {
      final id = cancel
          ? await cards!.cancel(quote.id)
          : await cards!.pay(quote.id);
      if (!isClosed) {
        emit(
          id == null
              ? const CheckoutState()
              : CheckoutState(quote: quote, orderId: id),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          e is CheckoutFailure && e.stale
              ? const CheckoutState(stale: true)
              : CheckoutState(quote: quote, failed: true, cardPending: true),
        );
      }
    }
  }

  @override
  Future<void> close() {
    ++_generation;
    return super.close();
  }
}
