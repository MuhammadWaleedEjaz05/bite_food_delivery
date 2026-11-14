import 'app_navigation.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:bite_food_delivery/features/dashboard/pages/dashboard_screen.dart';
import 'package:bite_food_delivery/features/home/pages/home_screen.dart';
import 'package:bite_food_delivery/features/orders/pages/orders_screen.dart';
import 'package:bite_food_delivery/features/restaurants/pages/catalog_unavailable_screen.dart';
import 'discovery_scope.dart';
import 'package:bite_food_delivery/features/profile/pages/profile_screen.dart';
import 'package:bite_food_delivery/features/onboarding/pages/splash_screen.dart';
import 'package:bite_food_delivery/features/onboarding/pages/onboarding_screen.dart';
import 'legacy_routes.dart';
import 'catalog_route_scope.dart';

abstract final class AppRouter {
  static const protectedPaths = {
    '/address_screen',
    '/person_info_screen',
    '/cart_screen',
    '/order_history_screen',
    '/notification',
    '/add_address_screen',
    '/update_address_screen',
    '/review_screen',
    '/my_reviews_screen',
    '/payment_screen',
    '/add_card_screen',
    '/checkout_screen',
    '/track_order_screen',
  };
  static String? guard(String location, {required bool signedIn}) {
    final uri = Uri.parse(location);
    if (!signedIn && protectedPaths.contains(uri.path)) {
      // Legacy payload-dependent routes resume at their safe entry point.
      final target = switch (uri.path) {
        '/checkout_screen' => '/cart_screen',
        '/update_address_screen' => '/address_screen',
        '/review_screen' => '/order_history_screen',
        _ => location,
      };
      return Uri(
        path: '/login_screen',
        queryParameters: {'from': target},
      ).toString();
    }
    return null;
  }

  static GoRouter create({
    required bool Function() signedIn,
    String initialLocation = '/',
    Listenable? refreshListenable,
    List<Widget>? tabs,
    Widget Function(StatefulNavigationShell)? shellBuilder,
  }) => GoRouter(
    initialLocation: initialLocation,
    refreshListenable: refreshListenable,
    redirect: (_, state) {
      final guarded = guard(state.uri.toString(), signedIn: signedIn());
      if (guarded != null) return guarded;
      final path = state.uri.path;
      final canonical = AppNavigation.location(path, state.extra);
      if (canonical != path) return canonical;
      if (path == '/review_screen' && state.extra is! OrderModel) {
        return '/order_history_screen';
      }
      if (path == '/update_address_screen' && state.extra is! AddressModel) {
        return '/address_screen';
      }
      return null;
    },
    errorBuilder: (_, _) => const CatalogUnavailableScreen(),
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SplashScreen()),
      GoRoute(
        path: '/discover/category/:category',
        builder: (_, state) => DiscoveryScope(
          key: ValueKey(state.uri.path),
          category: state.pathParameters['category']!,
        ),
      ),
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingScreen()),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) =>
            shellBuilder?.call(shell) ?? DashboardScreen(shell: shell),
        branches: [
          for (var i = 0; i < 4; i++)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ['/home', '/discover', '/orders', '/account'][i],
                  builder: (_, _) =>
                      (tabs ??
                      const [
                        HomeScreen(),
                        DiscoveryScope(),
                        OrdersScreen(),
                        ProfileScreen(),
                      ])[i],
                ),
              ],
            ),
        ],
      ),
      GoRoute(
        path: '/restaurants/:id',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          name: state.uri.toString(),
          transitionDuration: const Duration(milliseconds: 260),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );
            return FadeTransition(
              opacity: curved,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.05, 0),
                  end: Offset.zero,
                ).animate(curved),
                child: child,
              ),
            );
          },
          child: CatalogRouteScope(
            key: ValueKey(state.uri.path),
            id: state.pathParameters['id']!,
          ),
        ),
      ),
      GoRoute(
        path: '/foods/:id',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          name: state.uri.toString(),
          transitionDuration: const Duration(milliseconds: 260),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );
            return FadeTransition(
              opacity: curved,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.05, 0),
                  end: Offset.zero,
                ).animate(curved),
                child: child,
              ),
            );
          },
          child: CatalogRouteScope(
            key: ValueKey(state.uri.path),
            id: state.pathParameters['id']!,
            food: true,
          ),
        ),
      ),
      for (final entry in routes.entries)
        GoRoute(
          path: entry.key,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            name: state.uri.toString(),
            arguments: state.extra,
            transitionDuration: const Duration(milliseconds: 260),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final curved = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                    reverseCurve: Curves.easeInCubic,
                  );
                  return FadeTransition(
                    opacity: curved,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.05, 0),
                        end: Offset.zero,
                      ).animate(curved),
                      child: child,
                    ),
                  );
                },
            child: Builder(builder: entry.value),
          ),
        ),
    ],
  );
}
