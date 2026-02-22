import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bloc/bloc.dart';

class PaymentMethodSelectorCubit extends Cubit<CreditCardModel> {
  PaymentMethodSelectorCubit()
    : super(
        CreditCardModel(
          cardHolderName: '',
          cardNumber: '',
          expiryDate: '',
          cvv: '',
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
          cardNumber: '',
          expiryDate: '',
          cvv: '',
          cardType: CreditCardType.onCash,
        ),
      );
    } else {
      emit(creditCard!);
    }
  }
}
