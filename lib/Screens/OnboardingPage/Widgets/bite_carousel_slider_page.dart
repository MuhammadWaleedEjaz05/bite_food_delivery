import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteCarouselSliderPage extends StatelessWidget {
  final String title;
  final String description;
  const BiteCarouselSliderPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            width: 250.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        20.verticalSpace,
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        10.verticalSpace,
        Text(
          description,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        20.verticalSpace,
      ],
    );
  }
}
