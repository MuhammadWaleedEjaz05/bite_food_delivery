import 'package:bite_food_delivery/Cubits/CreditCardCubit/credit_card_cubit.dart';
import 'package:bite_food_delivery/Cubits/PaymentCubit/payment_method_selector_cubit.dart';
import 'package:bite_food_delivery/Models/credit_card_model.dart';
import 'package:bite_food_delivery/configs/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCreditCardTile extends StatefulWidget {
  final CreditCardModel creditCard;
  const BiteCreditCardTile({super.key, required this.creditCard});

  @override
  State<BiteCreditCardTile> createState() => _BiteCreditCardTileState();
}

class _BiteCreditCardTileState extends State<BiteCreditCardTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.r),
        border: _isExpanded
            ? Border.all(color: primaryColor.withAlpha(50), width: 1.5)
            : Border.all(color: Colors.transparent, width: 1.5),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleExpansion,
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    switch (widget.creditCard.cardType) {
                      CreditCardType.visa => 'assets/svgs/Visa.svg',
                      CreditCardType.mastercard => 'assets/svgs/Mastercard.svg',
                      CreditCardType.onCash => 'assets/svgs/Cash.svg',
                      CreditCardType.paypal => 'assets/svgs/Paypal.svg',
                    },
                    height: 24.h,
                    width: 36.w,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** ${widget.creditCard.cardNumber.substring(widget.creditCard.cardNumber.length - 4)}',
                        style: GoogleFonts.sen(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors.black87,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        widget.creditCard.cardHolderName,
                        style: GoogleFonts.sen(
                          fontSize: 13.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: primaryColor,
                    size: 24.r,
                  ),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                children: [
                  Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                  12.verticalSpace,
                  _CardDetailRow(
                    icon: Icons.person_outline_rounded,
                    label: 'Card Holder',
                    value: widget.creditCard.cardHolderName,
                  ),
                  10.verticalSpace,
                  _CardDetailRow(
                    icon: Icons.calendar_today_rounded,
                    label: 'Expiry Date',
                    value: widget.creditCard.expiryDate,
                  ),
                  10.verticalSpace,
                  _CardDetailRow(
                    icon: Icons.public_rounded,
                    label: 'Country',
                    value: 'Pakistan',
                  ),
                  14.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child:
                            BlocBuilder<
                              PaymentMethodSelectorCubit,
                              CreditCardModel
                            >(
                              builder: (context, selectedCard) {
                                final isSelected =
                                    selectedCard.cardNumber ==
                                    widget.creditCard.cardNumber;
                                return ElevatedButton.icon(
                                  onPressed: isSelected
                                      ? null
                                      : () {
                                          context
                                              .read<
                                                PaymentMethodSelectorCubit
                                              >()
                                              .selectPaymentMethod(
                                                widget.creditCard,
                                                widget.creditCard.cardType,
                                              );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Selected ${widget.creditCard.cardType == CreditCardType.onCash ? 'Cash on Delivery' : 'Card ending in ${widget.creditCard.cardNumber.substring(widget.creditCard.cardNumber.length - 4)}'} as payment method',
                                              ),
                                              duration: const Duration(
                                                seconds: 2,
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                  icon: Icon(
                                    isSelected
                                        ? Icons.check_circle_rounded
                                        : Icons.credit_card_rounded,
                                    size: 20.r,
                                  ),
                                  label: Text(
                                    isSelected ? 'Selected' : 'Select Card',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                    ),
                                    backgroundColor: isSelected
                                        ? Colors.green.shade50
                                        : primaryColor.withAlpha(25),
                                    foregroundColor: isSelected
                                        ? Colors.green
                                        : primaryColor,
                                    disabledBackgroundColor:
                                        Colors.green.shade50,
                                    disabledForegroundColor: Colors.green,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    textStyle: GoogleFonts.sen(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context
                                .read<PaymentMethodSelectorCubit>()
                                .selectPaymentMethod(
                                  null,
                                  CreditCardType.onCash,
                                );
                            context.read<CreditCardCubit>().deleteCreditCard(
                              getCurrentUser()!.uid,
                              widget.creditCard.cardNumber,
                            );
                          },
                          icon: Icon(Icons.delete_outline_rounded, size: 20.r),
                          label: Text('Remove Card'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            backgroundColor: Colors.red.shade50,
                            foregroundColor: Colors.red,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            textStyle: GoogleFonts.sen(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}

class _CardDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _CardDetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.r, color: primaryColor),
          10.horizontalSpace,
          Text(
            label,
            style: GoogleFonts.sen(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.sen(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
