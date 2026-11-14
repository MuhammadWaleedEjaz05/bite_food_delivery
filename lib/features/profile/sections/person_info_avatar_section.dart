import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_avatar.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonInfoAvatarSection extends StatelessWidget {
  const PersonInfoAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BlocBuilder<UserAuthCubit, UserAuthState>(
            builder: (context, state) {
              final user = state is UserLoggedIn ? state.user : null;
              return ProfileAvatar(
                fullName: user?.fullName ?? 'User',
                photoUrl: user?.photoUrl,
                radius: 54,
                onEditTap: () {
                  // Photo update placeholder
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
