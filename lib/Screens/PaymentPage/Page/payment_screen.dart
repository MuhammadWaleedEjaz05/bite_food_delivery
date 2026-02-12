import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Screens/PaymentPage/Widgets/bite_payment_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _AppSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            20.verticalSpace,
            _PaymentSelectionSection(),
            20.verticalSpace,
            _CreditCardListSection(),
            Spacer(),
            _AddCardSection(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _AddCardSection extends StatelessWidget {
  const _AddCardSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_card_screen');
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: GoogleFonts.sen(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Text('Add New Card'),
          ),
        ),
      ],
    );
  }
}

class _CreditCardListSection extends StatelessWidget {
  const _CreditCardListSection();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => 10.verticalSpace,
      itemBuilder: (context, index) => ExpansionTile(
        backgroundColor: Colors.grey.shade200,
        collapsedBackgroundColor: Colors.grey.shade200,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        leading: SvgPicture.asset(
          'assets/svgs/Visa.svg',
          height: 30.h,
          width: 30.w,
        ),
        title: Text(
          '**** **** **** 4242',
          style: GoogleFonts.sen(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Theme.of(context).primaryColor,
          ),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 5.w,
              children: [
                Flexible(
                  child: Text(
                    'Holder Name :',
                    style: GoogleFonts.sen(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'Waleed Ejaz',
                    style: GoogleFonts.sen(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 5.w,
              children: [
                Text(
                  'Expiry Date :',
                  style: GoogleFonts.sen(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('MM/yy').format(DateTime(2028, 02)),
                  style: GoogleFonts.sen(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade100,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 5.w,
              children: [
                Text(
                  'Country : ',
                  style: GoogleFonts.sen(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Pakistan',
                  style: GoogleFonts.sen(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentSelectionSection extends StatelessWidget {
  const _PaymentSelectionSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          BitePaymentBlock(svgPath: 'assets/svgs/Cash.svg'),
          10.horizontalSpace,
          BitePaymentBlock(svgPath: 'assets/svgs/Visa.svg'),
          10.horizontalSpace,
          BitePaymentBlock(svgPath: 'assets/svgs/Mastercard.svg'),
          10.horizontalSpace,
          BitePaymentBlock(svgPath: 'assets/svgs/Paypal.svg'),
          10.horizontalSpace,
        ],
      ),
    );
  }
}

class _AppSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Payment Method',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [],
    );
  }
}
