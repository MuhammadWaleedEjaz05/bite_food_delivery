import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BitePaymentBlock extends StatelessWidget {
  final String svgPath;
  final bool isSelected;
  const BitePaymentBlock({
    super.key,
    required this.svgPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.r),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary.withAlpha(50),
                width: 1.5,
              )
            : Border.all(color: Colors.transparent, width: 1.5),
      ),
      child: SvgPicture.asset(svgPath, height: 60.h, width: 60.w),
    );
  }
}
