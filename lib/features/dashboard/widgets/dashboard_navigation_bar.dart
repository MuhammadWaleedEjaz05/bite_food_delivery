import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';

class DashboardNavigationBar extends StatelessWidget {
  const DashboardNavigationBar({
    super.key,
    required this.index,
    required this.labels,
    required this.onSelected,
  });
  final int index;
  final List<String> labels;
  final ValueChanged<int> onSelected;
  static const icons = [
    Icons.home_outlined,
    Icons.explore_outlined,
    Icons.receipt_long_outlined,
    Icons.person_outline,
  ];
  static const selectedIcons = [
    Icons.home_rounded,
    Icons.explore_rounded,
    Icons.receipt_long_rounded,
    Icons.person_rounded,
  ];
  @override
  Widget build(BuildContext context) => Material(
    color: context.appColors.surface,
    child: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8).r,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < labels.length; i++)
              Expanded(
                child: Semantics(
                  selected: index == i,
                  button: true,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20).r,
                    onTap: () => onSelected(i),
                    child: Padding(
                      padding: const EdgeInsets.all(8).r,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ).r,
                            decoration: BoxDecoration(
                              color: index == i
                                  ? context.appColors.primaryContainer
                                  : context.appColors.surface,
                              borderRadius: BorderRadius.circular(18).r,
                            ),
                            child: Icon(
                              index == i ? selectedIcons[i] : icons[i],
                              size: 24.r,
                              color: index == i
                                  ? context.appColors.onPrimaryContainer
                                  : context.appColors.onSurfaceVariant,
                            ),
                          ),
                          4.verticalSpace,
                          AppText(
                            labels[i],
                            textAlign: TextAlign.center,
                            style: AppTextStyles.labelSmall(context).copyWith(
                              color: index == i
                                  ? context.appColors.primary
                                  : context.appColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
