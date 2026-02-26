import 'package:bite_food_delivery/configs/order_history_tab_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteTabBar extends StatelessWidget {
  const BiteTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.deepOrange,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.deepOrange,
      labelStyle: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
      unselectedLabelStyle: GoogleFonts.sen(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      tabs: tabsList,
    );
  }
}
