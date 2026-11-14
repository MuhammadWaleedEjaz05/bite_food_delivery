import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/features/authentication/bloc/signup_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_switch_prompt.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupActionsSection extends StatelessWidget {
  const SignupActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      sliver: SliverToBoxAdapter(
        child: BlocConsumer<UserAuthCubit, UserAuthState>(
          listener: (context, state) {
            if (state is UserCreated) {
              AppFeedback.showSuccess(
                context,
                'Account created successfully! Please log in.',
              );
              Navigator.of(context).pop();
            } else if (state is UserAuthError) {
              AppFeedback.showError(context, state.message);
            }
          },
          builder: (context, authState) {
            final isLoading = authState is UserLoading;

            return Column(
              children: [
                AppPrimaryButton(
                  label: t.signUp,
                  busy: isLoading,
                  onTap: () => context.read<SignupFormCubit>().submit(context),
                ),
                20.verticalSpace,
                AuthSwitchPrompt(
                  promptText: 'Already have an account?',
                  actionText: t.logIn,
                  onTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    } else {
                      AppNavigation.push(context, '/login_screen');
                    }
                  },
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
