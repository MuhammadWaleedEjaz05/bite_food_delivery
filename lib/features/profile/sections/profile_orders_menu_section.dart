import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_group.dart';
import 'package:bite_food_delivery/features/profile/widgets/profile_menu_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOrdersMenuSection extends StatelessWidget {
  const ProfileOrdersMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isLoggedIn = context.watch<UserAuthCubit>().state is UserLoggedIn;

    return SliverPadding(
      padding: context.contentInsets(bottom: 16),
      sliver: SliverToBoxAdapter(
        child: ProfileMenuGroup(
          children: [
            ProfileMenuTile(
              icon: Icons.receipt_long_outlined,
              title: t.orderHistory,
              onTap: () => AppNavigation.push(
                context,
                isLoggedIn ? '/order_history_screen' : '/login_screen',
              ),
            ),
            ProfileMenuTile(
              icon: Icons.shopping_bag_outlined,
              title: t.cart,
              onTap: () => AppNavigation.push(context, '/cart_screen'),
            ),
            ProfileMenuTile(
              icon: Icons.favorite_border_rounded,
              title: t.favorites,
              onTap: () => AppNavigation.push(context, '/favourite'),
            ),
            if (isLoggedIn)
              ProfileMenuTile(
                icon: Icons.rate_review_outlined,
                title: t.myReviews,
                onTap: () => AppNavigation.push(context, '/my_reviews_screen'),
              ),
            ProfileMenuTile(
              icon: Icons.notifications_none_rounded,
              title: t.notifications,
              onTap: () => AppNavigation.push(context, '/notification'),
            ),
          ],
        ),
      ),
    );
  }
}
