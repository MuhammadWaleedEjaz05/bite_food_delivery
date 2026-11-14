import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:bite_food_delivery/features/restaurants/models/restaurants_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_item_model.dart';
import 'package:bite_food_delivery/features/food_items/models/food_detail_arguments.dart';

/// Compatibility boundary for destinations still using legacy argument payloads.
abstract final class AppNavigation {
  static String location(String route, Object? arguments) {
    if (route == '/category_screen') {
      return arguments is String && arguments.isNotEmpty
          ? '/discover/category/${Uri.encodeComponent(arguments)}'
          : '/discover';
    }
    if (route == '/restaurant_screen' && arguments is RestaurantModel) {
      return '/restaurants/${Uri.encodeComponent(arguments.id)}';
    }
    if (route == '/food_item_screen') {
      final item = arguments is FoodDetailArguments
          ? arguments.item
          : arguments is Map
          ? arguments['foodItem']
          : null;
      if (item is FoodItemModel) {
        return '/foods/${Uri.encodeComponent(item.id)}';
      }
    }
    return route;
  }

  static Future<T?> push<T>(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    final router = GoRouter.maybeOf(context);
    if (router == null) {
      return Navigator.pushNamed<T>(context, route, arguments: arguments);
    }
    final path = location(route, arguments);
    return router.push<T>(path, extra: path == route ? arguments : null);
  }

  static void finishSignIn(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router == null) {
      Navigator.pop(context);
      return;
    }
    final target = GoRouterState.of(context).uri.queryParameters['from'];
    if (target != null && target.startsWith('/') && !target.startsWith('//')) {
      router.go(target);
    } else if (router.canPop()) {
      router.pop();
    } else {
      router.go('/home');
    }
  }

  static void back(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router == null) {
      Navigator.maybePop(context);
      return;
    }
    if (router.canPop()) {
      router.pop();
    } else {
      router.go('/home');
    }
  }
}
