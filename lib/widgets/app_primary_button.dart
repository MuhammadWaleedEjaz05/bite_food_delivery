import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.busy = false,
  });
  final String label;
  final VoidCallback? onTap;
  final bool busy;
  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: busy ? null : onTap,
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.all(16).r,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18).r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (busy) ...[
          SizedBox.square(
            dimension: 18.r,
            child: CircularProgressIndicator(strokeWidth: 2.r),
          ),
          10.horizontalSpace,
        ],
        Flexible(
          child: AppText(
            label,
            style: AppTextStyles.labelLarge(context).copyWith(
              color: onTap == null || busy
                  ? Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: .38)
                  : Theme.of(context).colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
