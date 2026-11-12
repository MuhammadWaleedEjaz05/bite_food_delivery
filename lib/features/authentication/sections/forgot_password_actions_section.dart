import 'package:bite_food_delivery/features/authentication/bloc/forgot_password_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordActionsSection extends StatelessWidget {
  const ForgotPasswordActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      sliver: SliverToBoxAdapter(
        child: BlocConsumer<UserAuthCubit, UserAuthState>(
          listener: (context, state) {
            final formCubit = context.read<ForgotPasswordFormCubit>();
            if (formCubit.state.isSubmitted && state is UserAuthInitial) {
              AppFeedback.showSuccess(context, t.passwordResetLinkSent);
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            } else if (state is UserAuthError) {
              AppFeedback.showError(context, state.message);
            }
          },
          builder: (context, authState) {
            final isLoading = authState is UserLoading;

            return Column(
              children: [
                AppPrimaryButton(
                  label: t.sendResetLink,
                  busy: isLoading,
                  onTap: () =>
                      context.read<ForgotPasswordFormCubit>().submit(context),
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
