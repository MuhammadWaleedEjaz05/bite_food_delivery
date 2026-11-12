import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppFeedback extends StatelessWidget {
  const AppFeedback({
    super.key,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.icon = Icons.restaurant_outlined,
  });
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData icon;

  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          message,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: context.appColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12).r,
        ),
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          message,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: Colors.white),
        ),
        backgroundColor: context.appColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12).r,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20).r,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28.r, color: context.appColors.onSurfaceVariant),
        12.verticalSpace,
        AppText(
          message,
          style: AppTextStyles.bodyMedium(context),
          textAlign: TextAlign.center,
        ),
        if (onAction != null && actionLabel != null)
          TextButton(
            onPressed: onAction,
            child: AppText(
              actionLabel!,
              style: AppTextStyles.labelLarge(context),
            ),
          ),
      ],
    ),
  );
}

class AppLoadingCard extends StatelessWidget {
  const AppLoadingCard({super.key});
  @override
  Widget build(BuildContext context) => Semantics(
    label: MaterialLocalizations.of(context).refreshIndicatorSemanticLabel,
    child: Container(
      height: 160.r,
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24).r,
      ),
      alignment: Alignment.center,
      child: const CircularProgressIndicator.adaptive(),
    ),
  );
}
