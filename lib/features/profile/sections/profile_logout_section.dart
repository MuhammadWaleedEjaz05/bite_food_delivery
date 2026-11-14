import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_group.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileLogoutSection extends StatelessWidget {
  const ProfileLogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final isLoggedIn = context.watch<UserAuthCubit>().state is UserLoggedIn;

    if (!isLoggedIn) return const SliverToBoxAdapter(child: SizedBox.shrink());

    return SliverPadding(
      padding: context.contentInsets(bottom: 32),
      sliver: SliverToBoxAdapter(
        child: ProfileMenuGroup(
          children: [
            ProfileMenuTile(
              icon: Icons.logout_rounded,
              iconColor: colors.error,
              title: t.logout,
              trailing: const SizedBox.shrink(),
              onTap: () => context.read<UserAuthCubit>().logout(),
            ),
          ],
        ),
      ),
    );
  }
}
