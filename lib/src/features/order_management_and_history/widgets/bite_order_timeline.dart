import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiteOrderTimeline extends StatelessWidget {
  final int currentStep;

  const BiteOrderTimeline({super.key, this.currentStep = 0});

  List<String> _getLabels(BuildContext context) => [
    AppLocalizations.of(context)!.yourOrderHasBeenReceived,
    AppLocalizations.of(context)!.theRestaurantIsPreparingYourFood,
    AppLocalizations.of(context)!.yourOrderHasBeenPickedUpForDelivery,
    AppLocalizations.of(context)!.orderArrivingSoon,
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final labels = _getLabels(context);

    return Column(
      children: List.generate(labels.length, (index) {
        final bool isCompleted = index <= currentStep;
        final bool isActive = index == currentStep;
        final bool isLast = index == labels.length - 1;

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
                  labels[index],
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
