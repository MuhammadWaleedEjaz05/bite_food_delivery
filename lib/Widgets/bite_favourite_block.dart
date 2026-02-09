import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteFavouriteBlock extends StatelessWidget {
  const BiteFavouriteBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.r,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Name',
                    style: GoogleFonts.sen(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Restaurant',
                    style: GoogleFonts.sen(
                      fontSize: 15.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20.r),
                      Text(
                        '4.5',
                        style: GoogleFonts.sen(
                          fontSize: 15.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      10.horizontalSpace,
                      Icon(Icons.timelapse, color: Colors.amber, size: 20.r),
                      Text(
                        '15-20 min',
                        style: GoogleFonts.sen(
                          fontSize: 15.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              10.horizontalSpace,
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red, size: 20.r),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Order Again',
                    style: GoogleFonts.sen(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
