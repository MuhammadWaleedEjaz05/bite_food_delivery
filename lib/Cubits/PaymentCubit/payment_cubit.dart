import 'package:bite_food_delivery/configs/stripe_const.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final Dio dio = Dio();
  Future<void> processPayment(
    int amount,
    String currency,
    String paymentMethodId,
    String customerId,
  ) async {
    try {
      emit(PaymentProcessing());
      final clientSecret = await _createPaymentIntent(
        amount,
        currency,
        paymentMethodId,
        customerId,
      );

      String? ephemeralKey;
      if (customerId.isNotEmpty) {
        ephemeralKey = await _createEphemeralKey(customerId);
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Bite Food Delivery',
          customerId: customerId.isNotEmpty ? customerId : null,
          customerEphemeralKeySecret: ephemeralKey,
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      emit(PaymentSuccess());
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        emit(PaymentInitial());
      } else {
        emit(
          PaymentFailure(
            e.error.localizedMessage ?? e.error.message ?? e.toString(),
          ),
        );
      }
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  Future<String> _createPaymentIntent(
    int amount,
    String currency,
    String paymentMethodId,
    String customerId,
  ) async {
    try {
      final data = <String, String>{
        'amount': (amount * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      if (customerId.isNotEmpty) {
        data['customer'] = customerId;
      }
      if (paymentMethodId.isNotEmpty) {
        data['payment_method'] = paymentMethodId;
      }

      final response = await dio.post(
        stripeIntentUrl,
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      final paymentIntent = response.data;
      debugPrint('Payment Intent created: $paymentIntent');
      return paymentIntent['client_secret'] as String;
    } on DioException catch (e) {
      debugPrint('Error creating payment intent: $e');
      debugPrint('Stripe response body: ${e.response?.data}');
      rethrow;
    } catch (e) {
      debugPrint('Error creating payment intent: $e');
      rethrow;
    }
  }

  Future<String?> _createEphemeralKey(String customerId) async {
    try {
      final response = await dio.post(
        'https://api.stripe.com/v1/ephemeral_keys',
        data: {'customer': customerId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded',
            'Stripe-Version': '2024-06-20',
          },
        ),
      );
      return response.data['secret'] as String?;
    } catch (e) {
      debugPrint('Error creating ephemeral key: $e');
      return null;
    }
  }
}
