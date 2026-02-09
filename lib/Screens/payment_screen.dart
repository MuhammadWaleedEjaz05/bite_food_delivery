import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BiteAppBar(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            20.verticalSpace,
            SizedBox(
              height: 90.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  BiteMenuSection(
                    menuItems: [SizedBox(height: 60.h, width: 60.w)],
                  ),
                  10.horizontalSpace,
                  BiteMenuSection(
                    menuItems: [SizedBox(height: 60.h, width: 60.w)],
                  ),
                  10.horizontalSpace,
                  BiteMenuSection(
                    menuItems: [SizedBox(height: 60.h, width: 60.w)],
                  ),
                  10.horizontalSpace,
                  BiteMenuSection(
                    menuItems: [SizedBox(height: 60.h, width: 60.w)],
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            BiteMenuSection(
              menuItems: [
                ExpansionTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('******4242'),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
