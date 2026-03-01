import 'package:bite_food_delivery/Cubits/UserAuthCubit/user_auth_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final TextEditingController _controller = TextEditingController();

class BiteEditProfileModal extends StatelessWidget {
  final String title;
  const BiteEditProfileModal({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final userState = BlocProvider.of<UserAuthCubit>(context).state;
    if (userState is UserLoggedIn) {
      switch (title) {
        case 'Name':
          _controller.text = userState.user.fullName;
          break;
        case 'Email':
          _controller.text = userState.user.email;
          break;
        case 'Phone Number':
          _controller.text = userState.user.phoneNumber ?? '';
          break;
        default:
          _controller.text = '';
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BiteAppBar(
            title: Text(
              'Edit $title',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.onSecondaryFixed,
                ),
                icon: Icon(Icons.close, size: 20.r),
              ),
              15.horizontalSpace,
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter $title',
                  hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                  labelText: title,
                  labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onSecondaryFixed,
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<UserAuthCubit>(
                          context,
                        ).updateProfile(title, _controller.text.trim());
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      child: Text('Apply'),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}

void dispose() {
  _controller.dispose();
}
