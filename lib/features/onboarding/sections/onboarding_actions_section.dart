import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/onboarding_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/onboarding_state.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingActionsSection extends StatelessWidget {
  const OnboardingActionsSection({super.key});

  void _finishOnboarding(BuildContext context) {
    context.read<FirstTimeLaunchCubit>().setFirstTimeLaunched();
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                AppPrimaryButton(
                  label: state.isLastPage ? t.getStarted : t.next,
                  onTap: () {
                    if (state.isLastPage) {
                      _finishOnboarding(context);
                    } else {
                      context.read<OnboardingCubit>().nextPage();
                    }
                  },
                ),
                12.verticalSpace,
                TextButton(
                  onPressed: () => _finishOnboarding(context),
                  child: AppText(
                    t.skip,
                    style: AppTextStyles.bodyMedium(
                      context,
                    ).copyWith(color: colors.onSurfaceVariant),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
