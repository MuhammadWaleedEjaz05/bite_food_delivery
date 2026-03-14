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

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          S.of(context).personalInfo,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: const [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          30.verticalSpace,
          const _UserInfoSection(),
          40.verticalSpace,
          BiteMenuSection(
            menuItems: personalInfoList(
              context,
            ).map((e) => BiteMenuItem(item: e)).toList(),
          ),
        ],
      ),
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
            : Column(
                children: [
                  CircleAvatar(radius: 60.r, backgroundColor: Colors.grey),
                  20.verticalSpace,
                  Text(
                    S.of(context).guestUser,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    S.of(context).pleaseLoginToViewYourProfile,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
      },
    );
  }
}
