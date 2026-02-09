import 'package:bite_food_delivery/Widgets/bite_address_block.dart';
import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_menu_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            _AddressSection(),
            Spacer(),
            _AddAddressSection(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _AddAddressSection extends StatelessWidget {
  const _AddAddressSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/add_address_screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: Text('Add Address'),
          ),
        ),
      ],
    );
  }
}

class _AddressSection extends StatelessWidget {
  const _AddressSection();

  @override
  Widget build(BuildContext context) {
    return BiteMenuSection(menuItems: [BiteAddressBlock()]);
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
        'Address',
        style: GoogleFonts.sen(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [],
    );
  }
}
