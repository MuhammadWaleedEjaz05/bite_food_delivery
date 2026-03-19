import 'package:bite_food_delivery/src/features/authentication/cubits/user_auth_cubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_user_auth_text_field.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final _forgotPasswordFormKey = GlobalKey<FormState>();
final _forgotPasswordEmailController = TextEditingController();

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void dispose() {
    _forgotPasswordEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: const _HeadTitleSection(),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.r,
                    vertical: 20.h,
                  ),
                  children: [
                    10.verticalSpace,
                    Form(
                      key: _forgotPasswordFormKey,
                      child: BiteUserAuthTextField(
                        title: S.of(context).email,
                        isEmail: true,
                        controller: _forgotPasswordEmailController,
                      ),
                    ),
                    20.verticalSpace,
                    BlocConsumer<UserAuthCubit, UserAuthState>(
                      listener: (context, state) {
                        if (state is UserAuthInitial) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: Text(
                                  S.of(context).passwordResetLinkSent,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                content: Text(
                                  S
                                      .of(context)
                                      .checkYourEmailForAPasswordResetLink,
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).clearSnackBars();
                                      showTopSnackBar(Overlay.of(context), CustomSnackBar.success(message: S.of(context).passwordResetSuccessfully));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      S.of(context).done,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (state is UserAuthError) {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(message: state.message),
                          );
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is UserLoading;
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (_forgotPasswordFormKey.currentState!
                                            .validate()) {
                                          context
                                              .read<UserAuthCubit>()
                                              .resetPassword(
                                                _forgotPasswordEmailController
                                                    .text
                                                    .trim(),
                                              );
                                        }
                                      },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 10.h,
                                  ),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  textStyle: Theme.of(
                                    context,
                                  ).textTheme.titleLarge,
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      )
                                    : Text(S.of(context).sendResetLink),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadTitleSection extends StatelessWidget {
  const _HeadTitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BiteAppBar(
          backButton: true,
          isDarkMode: true,
          title: SizedBox.shrink(),
          actions: [],
        ),
        Text(
          S.of(context).forgotPassword,
          style: Theme.of(context).textTheme.displayLarge,
        ),

        Text(
          S.of(context).pleaseEnterYourEmailAddressToReceiveAPasswordReset,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
