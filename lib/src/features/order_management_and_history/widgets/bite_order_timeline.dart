import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteOrderTimeline extends StatelessWidget {
  final int currentStep;

  const BiteOrderTimeline({super.key, this.currentStep = 0});

  static final List<String> _labels = [
    S.current.yourOrderHasBeenReceived,
    S.current.theRestaurantIsPreparingYourFood,
    S.current.yourOrderHasBeenPickedUpForDelivery,
    S.current.orderArrivingSoon,
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: List.generate(_labels.length, (index) {
        final bool isCompleted = index <= currentStep;
        final bool isActive = index == currentStep;
        final bool isLast = index == _labels.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30.w,
              child: Column(
                children: [
                  Container(
                    height: 22.r,
                    width: 22.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted ? primaryColor : Colors.grey.shade300,
                      border: isActive
                          ? Border.all(
                              color: primaryColor.withAlpha(100),
                              width: 3.r,
                            )
                          : null,
                    ),
                    child: isCompleted
                        ? Icon(Icons.check, size: 14.r, color: Colors.white)
                        : null,
                  ),
                  if (!isLast)
                    Container(
                      width: 2.w,
                      height: 28.h,
                      color: isCompleted ? primaryColor : Colors.grey.shade300,
                    ),
                ],
              ),
            ),
            12.horizontalSpace,

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  _labels[index],
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isCompleted
                        ? primaryColor
                        : Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
