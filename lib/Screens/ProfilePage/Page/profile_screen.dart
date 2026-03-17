import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_item.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_section.dart';
import 'package:bite_food_delivery/configs/profile_menu_items_list.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          const _UserInfoSection(),
          30.verticalSpace,
          const _MenuSection(),
          30.verticalSpace,
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        return Column(
          children: [
            state is UserLoggedIn
                ? BiteMenuSection(
                    menuItems: pInfoList(
                      context,
                    ).map((item) => BiteMenuItem(item: item)).toList(),
                  )
                : const SizedBox.shrink(),
            20.verticalSpace,
            state is UserLoggedIn
                ? BiteMenuSection(
                    menuItems: pAppList(
                      context,
                    ).map((item) => BiteMenuItem(item: item)).toList(),
                  )
                : const SizedBox.shrink(),
            20.verticalSpace,
            BiteMenuSection(
              menuItems: pSupportList(
                context,
              ).map((item) => BiteMenuItem(item: item)).toList(),
            ),
            30.verticalSpace,
            state is UserLoggedIn
                ? BiteMenuSection(
                    menuItems: [
                      BiteMenuItem(
                        item: BiteMenuItemModel(
                          leadingIcon: Icons.logout,
                          leadingIconColor: Colors.red,
                          title: S.of(context).logout,
                          onTap: () {
                            context.read<UserAuthCubit>().logout();
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  const _UserInfoSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 75.h,
              width: 75.w,
            ),
          );
        } else if (state is UserAuthError) {
          return Center(child: Text(state.message));
        }
        return state is UserLoggedIn
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state.user.photoUrl == ''
                      ? Container(
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                state.user.photoUrl ?? '',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 45.r,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          child: Text(
                            state.user.fullName.substring(0, 1).toUpperCase(),
                            style: Theme.of(context).textTheme.displayLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                  20.horizontalSpace,
                  SizedBox(
                    width: 175.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.fullName,
                          style: Theme.of(context).textTheme.headlineLarge,
                          softWrap: true,
                        ),
                        Text(
                          state.user.bio ?? 'I Love Fast Food',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  30.horizontalSpace,
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.w,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/login_screen'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10.r),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                    child: Text(S.of(context).login),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/signup_screen'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10.r),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                    child: Text(S.of(context).signup),
                  ),
                ],
              );
      },
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      title: Text(
        S.of(context).profile,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [],
    );
  }
}
