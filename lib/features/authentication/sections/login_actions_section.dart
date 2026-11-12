import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/authentication/bloc/login_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_social_button.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_switch_prompt.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginActionsSection extends StatelessWidget {
  const LoginActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      sliver: SliverToBoxAdapter(
        child: BlocConsumer<UserAuthCubit, UserAuthState>(
          listener: (context, state) {
            if (state is UserAuthError) {
              AppFeedback.showError(context, state.message);
            }
          },
          builder: (context, authState) {
            final isLoading = authState is UserLoading;

            return Column(
              children: [
                AppPrimaryButton(
                  label: t.logIn,
                  busy: isLoading,
                  onTap: () => context.read<LoginFormCubit>().submit(context),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: colors.outlineVariant.withValues(alpha: 0.4),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppText(
                        t.or,
                        style: AppTextStyles.bodyMedium(
                          context,
                        ).copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: colors.outlineVariant.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthSocialButton(
                      svgAsset: 'assets/svgs/google.svg',
                      isLoading: isLoading,
                      onTap: () {
                        context.read<UserAuthCubit>().signInWithGoogle();
                      },
                    ),
                  ],
                ),
                20.verticalSpace,
                AuthSwitchPrompt(
                  promptText: t.dontHaveAnAccount,
                  actionText: t.signUp,
                  onTap: () => AppNavigation.push(context, '/signup_screen'),
                ),
                16.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
