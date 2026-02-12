import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteMenuSection extends StatelessWidget {
  final List<Widget> menuItems;
  const BiteMenuSection({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(spacing: 10.h, children: menuItems),
    );
  }
}
