import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_item.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_section.dart';
import 'package:bite_food_delivery/configs/profile_menu_items_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          _UserInfoSection(),
          30.verticalSpace,
          _MenuSection(),
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
              menuItems: pAppList(
                context,
              ).map((item) => BiteMenuItem(item: item)).toList(),
            ),
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
                          title: 'Logout',
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
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserAuthError) {
          return Center(child: Text(state.message));
        }
        return state is UserLoggedIn
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade500,
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
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/signup_screen'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10.r),
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                    child: Text('SignUp'),
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
        'Profile',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Colors.deepOrange,
        ),
      ),
      actions: [],
    );
  }
}
