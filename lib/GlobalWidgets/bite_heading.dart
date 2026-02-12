import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteHeading extends StatelessWidget {
  const BiteHeading({
    super.key,
    required this.title,
    required this.isSeeAll,
    this.onSeeAllPressed,
  });

  final String title;
  final bool isSeeAll;
  final VoidCallback? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: GoogleFonts.sen(fontSize: 20.sp)),
      trailing: TextButton.icon(
        iconAlignment: IconAlignment.end,
        onPressed: onSeeAllPressed,
        icon: isSeeAll
            ? Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Theme.of(context).primaryColor,
              )
            : SizedBox.shrink(),
        label: isSeeAll
            ? Text(
                'See All',
                style: GoogleFonts.sen(
                  fontSize: 16.sp,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
