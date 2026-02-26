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

class PersonInfoScreen extends StatelessWidget {
  const PersonInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BiteAppBar(
        backButton: true,
        title: Text(
          'Personal Info',
          style: GoogleFonts.sen(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          30.verticalSpace,
          _UserInfoSection(),
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
                          style: GoogleFonts.sen(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.user.bio ?? 'I Love Fast Food',
                          style: GoogleFonts.sen(
                            fontSize: 15.sp,
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
            : Column(
                children: [
                  CircleAvatar(radius: 60.r, backgroundColor: Colors.grey),
                  20.verticalSpace,
                  Text(
                    'Guest User',
                    style: GoogleFonts.sen(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Please login to view your profile',
                    style: GoogleFonts.sen(
                      fontSize: 15.sp,
                      color: Colors.grey.shade500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
      },
    );
  }
}
