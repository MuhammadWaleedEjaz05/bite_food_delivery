import 'package:bite_food_delivery/Widgets/bite_add_c_c_text_field.dart';
import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _AppBarSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            20.verticalSpace,
            _CardDetailsSection(),
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
            child: Text('Add Card'),
          ),
        ),
      ],
    );
  }
}

class _CardDetailsSection extends StatelessWidget {
  const _CardDetailsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteAddCCTextField(title: 'Card Number'),
        10.verticalSpace,
        BiteAddCCTextField(title: 'Card Holder Name'),
        10.verticalSpace,
        Row(
          children: [
            Expanded(child: BiteAddCCTextField(title: 'Expiry Date')),
            20.horizontalSpace,
            Expanded(child: BiteAddCCTextField(title: 'CVV')),
          ],
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Add Card',
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
