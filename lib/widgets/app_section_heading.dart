import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final heading = AppText(
        title,
        style: AppTextStyles.titleLarge(
          context,
        ).copyWith(fontWeight: FontWeight.bold),
      );
      if (actionLabel == null || onAction == null) {
        return SizedBox(width: double.infinity, child: heading);
      }
      final action = TextButton(
        onPressed: onAction,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h).r,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: AppText(
          actionLabel!,
          style: AppTextStyles.labelLarge(context).copyWith(
            color: context.appColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
      if (MediaQuery.textScalerOf(context).scale(1) > 1.3) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [heading, 4.verticalSpace, action],
          ),
        );
      }
      return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: heading),
            8.horizontalSpace,
            action,
          ],
        ),
      );
    },
  );
}
