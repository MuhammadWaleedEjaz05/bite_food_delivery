import 'package:equatable/equatable.dart';

enum CreditCardType { visa, mastercard, onCash, paypal, card }

class CreditCardModel extends Equatable {
  final CreditCardType cardType;
  final String paymentMethodId;
  final String customerId;
  final String last4;
  final String cardHolderName;
  final String expiryDate;

  const CreditCardModel({
    required this.cardType,
    required this.paymentMethodId,
    required this.customerId,
    required this.last4,
    required this.cardHolderName,
    required this.expiryDate,
  });

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    String last4 = map['last4'] ?? '';
    if (last4.isEmpty && map['cardNumber'] != null) {
      final cn = (map['cardNumber'] as String).replaceAll(' ', '');
      last4 = cn.length >= 4 ? cn.substring(cn.length - 4) : cn;
    }

    return CreditCardModel(
      cardType: CreditCardType.values.firstWhere(
        (e) => e.toString() == 'CreditCardType.${map['cardType']}',
        orElse: () => CreditCardType.onCash,
      ),
      paymentMethodId: map['paymentMethodId'] ?? '',
      customerId: map['customerId'] ?? '',
      last4: last4,
      cardHolderName: map['cardHolderName'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardType': cardType.toString().split('.').last,
      'paymentMethodId': paymentMethodId,
      'customerId': customerId,
      'last4': last4,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
    };
  }

  CreditCardModel copyWith({
    CreditCardType? cardType,
    String? paymentMethodId,
    String? customerId,
    String? last4,
    String? cardHolderName,
    String? expiryDate,
  }) {
    return CreditCardModel(
      cardType: cardType ?? this.cardType,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      customerId: customerId ?? this.customerId,
      last4: last4 ?? this.last4,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  List<Object?> get props => [
    cardType,
    paymentMethodId,
    customerId,
    last4,
    cardHolderName,
    expiryDate,
  ];
}
