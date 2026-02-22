import 'package:equatable/equatable.dart';

enum CreditCardType { visa, mastercard, onCash, paypal }

class CreditCardModel extends Equatable {
  final CreditCardType cardType;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;
  const CreditCardModel({
    required this.cardType,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      cardType: CreditCardType.values.firstWhere(
        (e) => e.toString() == 'CreditCardType.${map['cardType']}',
      ),
      cardNumber: map['cardNumber'] ?? '',
      cardHolderName: map['cardHolderName'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
      cvv: map['cvv'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cardType': cardType.toString().split('.').last,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cvv': cvv,
    };
  }

  CreditCardModel copyWith({
    CreditCardType? cardType,
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    String? cvv,
  }) {
    return CreditCardModel(
      cardType: cardType ?? this.cardType,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
    );
  }

  @override
  List<Object?> get props => [
    cardType,
    cardNumber,
    cardHolderName,
    expiryDate,
    cvv,
  ];
}
