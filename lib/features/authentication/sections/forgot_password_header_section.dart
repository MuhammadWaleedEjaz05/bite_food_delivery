import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordHeaderSection extends StatelessWidget {
  const ForgotPasswordHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Navigator.of(context).canPop()) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(),
              ),
              16.verticalSpace,
            ] else
              24.verticalSpace,
            AppText(
              t.forgotPassword,
              style: AppTextStyles.headlineMedium(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            AppText(
              t.pleaseEnterYourEmailAddressToReceiveAPasswordReset,
              style: AppTextStyles.bodyLarge(
                context,
              ).copyWith(color: colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
