import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/custom_app_bar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h).r,
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
              20.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h).r,
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.waving_hand_rounded,
                    size: 13.r,
                    color: colors.primary,
                  ),
                  4.horizontalSpace,
                  AppText(
                    'WELCOME BACK',
                    style: AppTextStyles.labelSmall(context).copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            12.verticalSpace,
            AppText(
              t.logIn,
              style: AppTextStyles.headlineMedium(
                context,
              ).copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.5),
            ),
            8.verticalSpace,
            AppText(
              t.pleaseSignInToContinue,
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
