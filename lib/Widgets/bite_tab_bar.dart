import 'package:bite_food_delivery/configs/orderhistorytablist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteTabBar extends StatelessWidget {
  const BiteTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Theme.of(context).primaryColor,
      labelStyle: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
      unselectedLabelStyle: GoogleFonts.sen(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      tabs: tabsList,
    );
  }
}
