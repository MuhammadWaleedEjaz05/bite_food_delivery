import 'package:bite_food_delivery/GlobalWidgets/bite_address_text_field.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: _AppBarSection(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                children: [
                  20.verticalSpace,
                  _NewAddressSection(),
                  20.verticalSpace,
                  _SaveAddressSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewAddressSection extends StatelessWidget {
  const _NewAddressSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteAddressTextField(title: 'Address'),
        10.verticalSpace,
        Row(
          children: [
            Expanded(child: BiteAddressTextField(title: 'Street No.')),
            10.horizontalSpace,
            Expanded(child: BiteAddressTextField(title: 'POST Code')),
          ],
        ),
        10.verticalSpace,
        BiteAddressTextField(title: 'Apartment'),
      ],
    );
  }
}

class _SaveAddressSection extends StatelessWidget {
  const _SaveAddressSection();

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
            child: Text('Save'),
          ),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BiteAppBar(
          title: SizedBox.shrink(),
          actions: [],
          backButton: true,
          isDarkMode: true,
        ),
      ],
    );
  }
}
