import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_edit_dialog.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_group.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonInfoDetailsSection extends StatelessWidget {
  const PersonInfoDetailsSection({super.key});

  void _showEdit(
    BuildContext context, {
    required String title,
    required String initialValue,
    required String fieldKey,
  }) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<UserAuthCubit>(),
        child: ProfileEditDialog(
          title: title,
          initialValue: initialValue,
          fieldKey: fieldKey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return SliverPadding(
      padding: context.contentInsets(bottom: 32),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<UserAuthCubit, UserAuthState>(
          builder: (context, state) {
            final user = state is UserLoggedIn ? state.user : null;
            final fullName = user?.fullName ?? t.guestUser;
            final email = user?.email ?? '';
            final phone = user?.phoneNumber ?? '';
            final bio = user?.bio ?? '';

            return ProfileMenuGroup(
              children: [
                ProfileMenuTile(
                  icon: Icons.badge_outlined,
                  title: t.fullName,
                  subtitle: fullName,
                  onTap: () => _showEdit(
                    context,
                    title: t.fullName,
                    initialValue: fullName,
                    fieldKey: 'fullName',
                  ),
                ),
                ProfileMenuTile(
                  icon: Icons.email_outlined,
                  title: t.email,
                  subtitle: email,
                  onTap: () => _showEdit(
                    context,
                    title: t.email,
                    initialValue: email,
                    fieldKey: 'email',
                  ),
                ),
                ProfileMenuTile(
                  icon: Icons.phone_outlined,
                  title: t.phone,
                  subtitle: phone,
                  onTap: () => _showEdit(
                    context,
                    title: t.phone,
                    initialValue: phone,
                    fieldKey: 'phoneNumber',
                  ),
                ),
                ProfileMenuTile(
                  icon: Icons.notes_outlined,
                  title: 'Bio',
                  subtitle: bio.isEmpty ? 'No bio added' : bio,
                  onTap: () => _showEdit(
                    context,
                    title: 'Bio',
                    initialValue: bio,
                    fieldKey: 'bio',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
