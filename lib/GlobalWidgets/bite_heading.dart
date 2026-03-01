import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.normal),
      ),
      trailing: TextButton.icon(
        iconAlignment: IconAlignment.end,
        onPressed: onSeeAllPressed,
        icon: isSeeAll
            ? Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.deepOrange,
              )
            : SizedBox.shrink(),
        label: isSeeAll
            ? Text(
                'See All',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.normal,
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
