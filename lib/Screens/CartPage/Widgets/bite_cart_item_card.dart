import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteCartItemCard extends StatelessWidget {
  final bool isEditActive;
  const BiteCartItemCard({super.key, this.isEditActive = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 136.w,
            height: 170.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
        ),
        20.horizontalSpace,
        SizedBox(
          width: 175.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Item Name',
                style: GoogleFonts.sen(fontSize: 25.sp, color: Colors.white),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              Row(
                children: [
                  Text(
                    'PKR 400',
                    style: GoogleFonts.sen(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  isEditActive
                      ? IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            iconSize: 20.r,
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          icon: Icon(Icons.delete),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              10.verticalSpace,
              Text(
                'Extra Cheese + Extra Sauce + Extra Toppings',
                style: GoogleFonts.sen(fontSize: 12.sp, color: Colors.grey),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              15.verticalSpace,
              Row(
                spacing: 5.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(50),
                    ),
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.sen(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(50),
                    ),
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
