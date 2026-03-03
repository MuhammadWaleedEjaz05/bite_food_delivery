import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:bite_food_delivery/configs/firebase_db_conn.dart';
import 'package:bite_food_delivery/configs/stripe_const.dart';
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
      final response = await dio.post(
        'https://api.stripe.com/v1/payment_methods',
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
          headers: {
            'Authorization': 'Bearer $stripePublishableKey',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      final pmData = response.data;
      final paymentMethodId = pmData['id'] as String;
      final cardData = pmData['card'] ?? {};

      final existingIndex = _cachedCreditCards.indexWhere(
        (card) => card.paymentMethodId == paymentMethodId,
      );
      if (existingIndex != -1) {
        emit(CreditCardError('This card is already added.'));
        return;
      }

      final userEmail = getCurrentUser()?.email ?? userID;
      final customerId = await _getCustomerId(userEmail);
      if (customerId == null) {
        emit(CreditCardError('Failed to retrieve customer information.'));
        return;
      }

      await dio.post(
        'https://api.stripe.com/v1/payment_methods/$paymentMethodId/attach',
        data: {'customer': customerId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      final CreditCardType cardType;
      final brand = (cardData['brand'] ?? '').toString().toLowerCase();
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
          (cardData['last4'] ?? cardNumber.substring(cardNumber.length - 4))
              as String;
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
      final errorMsg = e.response?.data?['error']?['message'] ?? e.toString();
      debugPrint('Stripe error: $errorMsg');
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

  Future<String?> _getCustomerId(String userEmail) async {
    try {
      final response = await dio.get(
        "https://api.stripe.com/v1/customers",
        queryParameters: {'email': userEmail},
        options: Options(
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final customers = response.data['data'] as List? ?? [];
      if (customers.isNotEmpty) {
        return customers.first['id'] as String;
      }

      final createResponse = await dio.post(
        "https://api.stripe.com/v1/customers",
        data: {'email': userEmail},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      return createResponse.data['id'] as String?;
    } catch (e) {
      debugPrint('Error getting/creating Stripe customer: $e');
      return null;
    }
  }
}
