import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bloc/bloc.dart';

class PaymentMethodSelectorCubit extends Cubit<CreditCardModel> {
  PaymentMethodSelectorCubit()
    : super(
        CreditCardModel(
          cardHolderName: '',
          customerId: '',
          paymentMethodId: '',
          last4: '',
          expiryDate: '',
          cardType: CreditCardType.onCash,
        ),
      );

  void selectPaymentMethod(
    CreditCardModel? creditCard,
    CreditCardType? selectedType,
  ) {
    if (selectedType == CreditCardType.onCash) {
      emit(
        CreditCardModel(
          cardHolderName: 'Cash on Delivery',
          customerId: '',
          paymentMethodId: '',
          last4: '',
          expiryDate: '',
          cardType: CreditCardType.onCash,
        ),
      );
    } else {
      emit(creditCard!);
    }
  }
}
