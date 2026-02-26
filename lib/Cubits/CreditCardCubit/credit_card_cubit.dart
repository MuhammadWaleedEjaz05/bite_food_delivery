import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'credit_card_state.dart';

class CreditCardCubit extends Cubit<CreditCardState> {
  final List<CreditCardModel> _cachedCreditCards = [];
  CreditCardCubit([String? userID]) : super(CreditCardInitial()) {
    if (userID != null) loadCreditCards(userID);
  }

  Future<void> loadCreditCards(String userID) async {
    emit(CreditCardLoading());
    try {
      final collectionRef = getCollection('UsersDB');
      final docRef = collectionRef.doc(userID).collection('CreditCards');
      final snapshot = await docRef.get();
      final creditCards = snapshot.docs
          .map((doc) => CreditCardModel.fromMap(doc.data()))
          .toList();
      _cachedCreditCards.clear();
      _cachedCreditCards.addAll(creditCards);
      emit(CreditCardLoaded(creditCardList: _cachedCreditCards));
    } catch (e) {
      emit(CreditCardError(e.toString()));
    }
  }

  Future<void> addCreditCard(String userID, CreditCardModel creditCard) async {
    try {
      final collectionRef = getCollection('UsersDB');
      final docRef = collectionRef
          .doc(userID)
          .collection('CreditCards')
          .doc(creditCard.cardNumber);
      await docRef.set(creditCard.toMap());
      _cachedCreditCards.add(creditCard);
      emit(CreditCardAdded());
      emit(CreditCardLoaded(creditCardList: _cachedCreditCards));
    } catch (e) {
      emit(CreditCardError(e.toString()));
    }
  }

  Future<void> deleteCreditCard(String userID, String cardNumber) async {
    try {
      final collectionRef = getCollection('UsersDB');
      final docRef = collectionRef
          .doc(userID)
          .collection('CreditCards')
          .doc(cardNumber);
      await docRef.delete();
      _cachedCreditCards.removeWhere((card) => card.cardNumber == cardNumber);
      emit(CreditCardDeleted());
      emit(CreditCardLoaded(creditCardList: _cachedCreditCards));
    } catch (e) {
      emit(CreditCardError(e.toString()));
    }
  }
}
