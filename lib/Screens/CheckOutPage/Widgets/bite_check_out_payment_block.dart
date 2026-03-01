import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteCheckOutPaymentBlock extends StatelessWidget {
  final CreditCardModel? creditCard;
  const BiteCheckOutPaymentBlock({super.key, this.creditCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondaryFixed,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.credit_card, color: Colors.blue, size: 24.r),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creditCard!.cardHolderName,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                4.verticalSpace,
                Text(
                  creditCard!.cardType == CreditCardType.onCash
                      ? 'Pays When Order Arrives'
                      : creditCard!.cardNumber
                            .substring(creditCard!.cardNumber.length - 4)
                            .padLeft(16, '*'),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check_circle,
            color: Theme.of(context).colorScheme.primary,
            size: 22.r,
          ),
        ],
      ),
    );
  }
}
