import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AuthSwitchPrompt extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onTap;

  const AuthSwitchPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AppText(
          promptText,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: colors.onSurfaceVariant),
        ),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(foregroundColor: colors.primary),
          child: AppText(
            actionText,
            style: AppTextStyles.bodyMedium(
              context,
            ).copyWith(color: colors.primary, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
