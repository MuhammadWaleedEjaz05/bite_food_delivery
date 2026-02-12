import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteEditProfileModal extends StatelessWidget {
  final String title;
  const BiteEditProfileModal({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BiteAppBar(
            title: Text(
              'Edit $title',
              style: GoogleFonts.sen(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey.shade200,
                ),
                icon: Icon(Icons.close, size: 20.r),
              ),
              15.horizontalSpace,
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            children: [
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter $title',
                  hintStyle: GoogleFonts.sen(fontSize: 20.sp),
                  labelText: title,
                  labelStyle: GoogleFonts.sen(fontSize: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              20.verticalSpace,
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
                      child: Text('Apply'),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
