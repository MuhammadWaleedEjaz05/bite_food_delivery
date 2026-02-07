import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteOrderHistoryCard extends StatelessWidget {
  final bool isCompleted;
  const BiteOrderHistoryCard({super.key, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Category',
            style: GoogleFonts.sen(fontSize: 20.sp, color: Colors.grey),
          ),
          10.verticalSpace,
          Divider(thickness: 1.h),
          10.verticalSpace,
          Column(
            children: [
              Row(
                spacing: 10.w,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2.h,
                    children: [
                      Text(
                        'Pizza Hut',
                        style: GoogleFonts.sen(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      isCompleted
                          ? Text(
                              'Completed',
                              style: GoogleFonts.sen(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            )
                          : SizedBox.shrink(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5.w,
                        children: [
                          Text(
                            'Price',
                            style: GoogleFonts.sen(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '|',
                            style: GoogleFonts.sen(
                              fontSize: 20.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '3 Items',
                            style: GoogleFonts.sen(fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    'Order ID',
                    style: GoogleFonts.sen(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: !isCompleted
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('Track Order'),
                          )
                        : ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context).primaryColor,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            child: Text('Rate'),
                          ),
                  ),
                  30.horizontalSpace,
                  Expanded(
                    child: !isCompleted
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Theme.of(context).primaryColor,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            child: Text('Cancel'),
                          )
                        : ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text('Reorder'),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
