import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_avatar.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserCardSection extends StatelessWidget {
  const ProfileUserCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(20).r,
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24).r,
            border: Border.all(
              color: colors.outlineVariant.withValues(alpha: 0.6),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10.r,
                offset: Offset(0, 4.r),
              ),
            ],
          ),
          child: BlocBuilder<UserAuthCubit, UserAuthState>(
            builder: (context, state) {
              if (state is UserLoggedIn) {
                final user = state.user;
                return Row(
                  children: [
                    ProfileAvatar(
                      fullName: user.fullName,
                      photoUrl: user.photoUrl,
                      radius: 36,
                      onEditTap: () =>
                          AppNavigation.push(context, '/person_info_screen'),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            user.fullName,
                            style: AppTextStyles.titleLarge(
                              context,
                            ).copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                          4.verticalSpace,
                          AppText(
                            user.bio ?? user.email,
                            style: AppTextStyles.bodyMedium(
                              context,
                            ).copyWith(color: colors.onSurfaceVariant),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  Container(
                    width: 72.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 36.r,
                      color: colors.primary,
                    ),
                  ),
                  12.verticalSpace,
                  AppText(
                    t.guestUser,
                    style: AppTextStyles.titleMedium(context),
                  ),
                  6.verticalSpace,
                  AppText(
                    t.pleaseSignUpToGetStarted,
                    style: AppTextStyles.bodyMedium(
                      context,
                    ).copyWith(color: colors.onSurfaceVariant),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              AppNavigation.push(context, '/login_screen'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12).r,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14).r,
                            ),
                          ),
                          child: AppText(
                            t.login,
                            style: AppTextStyles.labelLarge(context),
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: FilledButton(
                          onPressed: () =>
                              AppNavigation.push(context, '/signup_screen'),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12).r,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14).r,
                            ),
                          ),
                          child: AppText(
                            t.signup,
                            style: AppTextStyles.labelLarge(context),
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
      ),
    );
  }
}
