import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/authentication/bloc/login_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/login_form_state.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_text_field.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final formCubit = context.read<LoginFormCubit>();

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<LoginFormCubit, LoginFormState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTextField(
                  label: t.email,
                  hintText: 'name@example.com',
                  initialValue: state.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: formCubit.setEmail,
                  errorText: state.emailError,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 20.r,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                16.verticalSpace,
                AuthTextField(
                  label: t.password,
                  hintText: '••••••••',
                  isPassword: true,
                  isPasswordVisible: state.isPasswordVisible,
                  onTogglePassword: formCubit.togglePasswordVisibility,
                  onChanged: formCubit.setPassword,
                  errorText: state.passwordError,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 20.r,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                12.verticalSpace,
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8.h,
                  children: [
                    BlocBuilder<RememberMeCubit, RememberMeState>(
                      builder: (context, rememberState) {
                        return InkWell(
                          onTap: () {
                            context.read<RememberMeCubit>().toggleRememberMe(
                              !rememberState.isRememberMe,
                              email: state.email.trim(),
                            );
                          },
                          borderRadius: BorderRadius.circular(6.r),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: rememberState.isRememberMe,
                                onChanged: (value) {
                                  context
                                      .read<RememberMeCubit>()
                                      .toggleRememberMe(
                                        value ?? false,
                                        email: state.email.trim(),
                                      );
                                },
                              ),
                              AppText(
                                t.rememberEmail,
                                style: AppTextStyles.bodyMedium(context),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () => AppNavigation.push(
                        context,
                        '/forgot_password_screen',
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: colors.primary,
                      ),
                      child: AppText(
                        t.forgotPassword,
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
