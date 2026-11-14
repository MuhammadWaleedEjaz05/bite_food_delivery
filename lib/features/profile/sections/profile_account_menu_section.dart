import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_group.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileAccountMenuSection extends StatelessWidget {
  const ProfileAccountMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isLoggedIn = context.watch<UserAuthCubit>().state is UserLoggedIn;

    if (!isLoggedIn) return const SliverToBoxAdapter(child: SizedBox.shrink());

    return SliverPadding(
      padding: context.contentInsets(bottom: 16),
      sliver: SliverToBoxAdapter(
        child: ProfileMenuGroup(
          children: [
            ProfileMenuTile(
              icon: Icons.person_outline_rounded,
              title: t.personalInfo,
              onTap: () => AppNavigation.push(context, '/person_info_screen'),
            ),
            ProfileMenuTile(
              icon: Icons.location_on_outlined,
              title: t.address,
              onTap: () => AppNavigation.push(context, '/address_screen'),
            ),
            ProfileMenuTile(
              icon: Icons.credit_card_outlined,
              title: t.paymentMethod,
              onTap: () => AppNavigation.push(context, '/payment_screen'),
            ),
          ],
        ),
      ),
    );
  }
}
