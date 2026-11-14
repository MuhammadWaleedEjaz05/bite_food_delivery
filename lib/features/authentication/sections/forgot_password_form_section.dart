import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/authentication/bloc/forgot_password_form_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/forgot_password_form_state.dart';
import 'package:bite_food_delivery/features/authentication/widgets/auth_text_field.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordFormSection extends StatelessWidget {
  const ForgotPasswordFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final formCubit = context.read<ForgotPasswordFormCubit>();

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<ForgotPasswordFormCubit, ForgotPasswordFormState>(
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
              ],
            );
          },
        ),
      ),
    );
  }
}
