import 'package:bite_food_delivery/src/features/payment/models/credit_card_model.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/src/services/firebase/firebase_db_conn.dart';
import 'package:bite_food_delivery/src/core/constants/stripe_const.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'credit_card_state.dart';

class CreditCardCubit extends Cubit<CreditCardState> {
  final List<CreditCardModel> _cachedCreditCards = [];
  CreditCardCubit([String? userID]) : super(CreditCardInitial()) {
    if (userID != null) loadCreditCards(userID);
  }
  Dio dio = Dio();
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
      Future.delayed(const Duration(seconds: 1));
      emit(CreditCardLoaded(creditCardList: _cachedCreditCards));
    } catch (e) {
      emit(CreditCardError(e.toString()));
    }
  }

  Future<void> addCreditCard(
    String userID, {
    required String cardHolderName,
    required String cardNumber,
    required String expMonth,
    required String expYear,
    required String cvc,
  }) async {
    try {
      final pmResponse = await dio.post(
        stripeCreatePaymentMethodUrl,
        data: {
          'type': 'card',
          'card[number]': cardNumber,
          'card[exp_month]': expMonth,
          'card[exp_year]': expYear,
          'card[cvc]': cvc,
          'billing_details[name]': cardHolderName,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': 'Bearer $stripePublishableKey'},
        ),
      );
      final paymentMethodId = pmResponse.data['id'] as String;
      final cardData = pmResponse.data['card'] as Map<String, dynamic>;

      final existingIndex = _cachedCreditCards.indexWhere(
        (card) => card.paymentMethodId == paymentMethodId,
      );
      if (existingIndex != -1) {
        emit(const CreditCardError('This card is already added.'));
        return;
      }

      final userEmail = getCurrentUser()?.email ?? userID;

      final customerResponse = await dio.post(
        stripeCreateCustomerUrl,
        data: {'email': userEmail, 'payment_method': paymentMethodId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': 'Bearer $stripeSecretKey'},
        ),
      );
      final customerId = customerResponse.data['id'] as String;

      await dio.post(
        stripeAttachPaymentMethodUrl(paymentMethodId),
        data: {'customer': customerId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': 'Bearer $stripeSecretKey'},
        ),
      );

      final CreditCardType cardType;
      final brand = (cardData['brand'] ?? '').toLowerCase();
      switch (brand) {
        case 'visa':
          cardType = CreditCardType.visa;
          break;
        case 'mastercard':
          cardType = CreditCardType.mastercard;
          break;
        default:
          cardType = CreditCardType.visa;
          break;
      }

      final last4 =
          cardData['last4'] ??
          cardNumber
              .replaceAll(' ', '')
              .substring(cardNumber.replaceAll(' ', '').length - 4);
      final shortYear = expYear.length >= 4 ? expYear.substring(2) : expYear;
      final creditCard = CreditCardModel(
        cardType: cardType,
        paymentMethodId: paymentMethodId,
        customerId: customerId,
        last4: last4,
        cardHolderName: cardHolderName,
        expiryDate: '${expMonth.padLeft(2, '0')}/$shortYear',
      );

      final collectionRef = getCollection('UsersDB');
      final docRef = collectionRef
          .doc(userID)
          .collection('CreditCards')
          .doc(paymentMethodId);
      await docRef.set(creditCard.toMap());
      _cachedCreditCards.add(creditCard);
      emit(CreditCardAdded());
      emit(CreditCardLoaded(creditCardList: _cachedCreditCards));
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['message'] ?? e.toString();
      debugPrint('Backend error: $errorMsg');
      emit(CreditCardError(errorMsg.toString()));
    } catch (e) {
      emit(CreditCardError(e.toString()));
    }
  }

  Future<void> deleteCreditCard(String userID, String paymentMethodId) async {
    try {
      final collectionRef = getCollection('UsersDB');
      final docRef = collectionRef
          .doc(userID)
          .collection('CreditCards')
          .doc(paymentMethodId);
      await docRef.delete();
      _cachedCreditCards.removeWhere(
        (card) => card.paymentMethodId == paymentMethodId,
      );
      emit(CreditCardDeleted());
      emit(CreditCardLoaded(creditCardList: _cachedCreditCards));
    } catch (e) {
      emit(CreditCardError(e.toString()));
    }
  }
}
