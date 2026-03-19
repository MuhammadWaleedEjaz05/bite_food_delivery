import 'package:bite_food_delivery/src/core/constants/stripe_const.dart';
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
    String customerId,
  ) async {
    try {
      emit(PaymentProcessing());

      final ephemeralResponse = await dio.post(
        stripeEphemeralKeysUrl,
        data: {'customer': customerId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Stripe-Version': '2020-08-27',
          },
        ),
      );
      final ephemeralKey = ephemeralResponse.data['secret'] as String?;

      final piResponse = await dio.post(
        stripePaymentIntentsUrl,
        data: {
          'amount': (amount * 100).toString(),
          'currency': currency,
          'customer': customerId,
          'payment_method_types[]': 'card',
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': 'Bearer $stripeSecretKey'},
        ),
      );
      final clientSecret = piResponse.data['client_secret'] as String;

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
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['message'] ?? 'Payment server error';
      debugPrint('Backend error: $errorMsg');
      emit(PaymentFailure(errorMsg.toString()));
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }
}
