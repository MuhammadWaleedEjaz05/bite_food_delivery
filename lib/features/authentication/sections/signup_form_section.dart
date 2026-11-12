import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/authentication/bloc/signup_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/signup_form_state.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_text_field.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupFormSection extends StatelessWidget {
  const SignupFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final formCubit = context.read<SignupFormCubit>();

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<SignupFormCubit, SignupFormState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthTextField(
                  label: t.fullName,
                  hintText: 'John Doe',
                  initialValue: state.fullName,
                  onChanged: formCubit.setFullName,
                  errorText: state.fullNameError,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    size: 20.r,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                16.verticalSpace,
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
                  label: t.phoneNumber,
                  hintText: '+1 234 567 8900',
                  initialValue: state.phoneNumber,
                  keyboardType: TextInputType.phone,
                  onChanged: formCubit.setPhoneNumber,
                  errorText: state.phoneError,
                  prefixIcon: Icon(
                    Icons.phone_outlined,
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
                16.verticalSpace,
                AuthTextField(
                  label: t.confirmPassword,
                  hintText: '••••••••',
                  isPassword: true,
                  isPasswordVisible: state.isConfirmPasswordVisible,
                  onTogglePassword: formCubit.toggleConfirmPasswordVisibility,
                  onChanged: formCubit.setConfirmPassword,
                  errorText: state.confirmPasswordError,
                  prefixIcon: Icon(
                    Icons.lock_clock_outlined,
                    size: 20.r,
                    color: colors.onSurfaceVariant,
                  ),
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
