import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCheckOutPaymentBlock extends StatelessWidget {
  final CreditCardModel? creditCard;
  const BiteCheckOutPaymentBlock({super.key, this.creditCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
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
                  style: GoogleFonts.sen(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                4.verticalSpace,
                Text(
                  creditCard!.cardType == CreditCardType.onCash
                      ? 'Pays When Order Arrives'
                      : creditCard!.cardNumber
                            .substring(creditCard!.cardNumber.length - 4)
                            .padLeft(16, '*'),
                  style: GoogleFonts.sen(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Colors.deepOrange, size: 22.r),
        ],
      ),
    );
  }
}
