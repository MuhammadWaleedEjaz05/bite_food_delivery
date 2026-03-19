import 'package:bite_food_delivery/src/features/payment/models/credit_card_model.dart';
import 'package:bloc/bloc.dart';

class CreditCardTypeSelectorCubit extends Cubit<CreditCardType> {
  CreditCardTypeSelectorCubit() : super(CreditCardType.onCash);

  void selectCardType(CreditCardType type) {
    emit(type);
  }
}
