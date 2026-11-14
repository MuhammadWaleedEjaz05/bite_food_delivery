import 'package:bite_food_delivery/features/payments/pages/payment_screen.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/app/routes/catalog_routes.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/core/services/phone_call/phone_call_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/remember_me_cubit.dart';
import 'package:bite_food_delivery/features/addresses/pages/add_address_screen.dart';
import 'package:bite_food_delivery/features/addresses/pages/address_screen.dart';
import 'package:bite_food_delivery/features/addresses/pages/update_address_screen.dart';
import 'package:bite_food_delivery/features/categories/pages/all_category_screen.dart';
import 'checkout_scope.dart';
import 'package:bite_food_delivery/features/authentication/pages/forgot_password_screen.dart';
import 'package:bite_food_delivery/features/restaurants/pages/all_restaurant_screen.dart';
import 'package:bite_food_delivery/features/cart/pages/cart_screen.dart';
import 'package:bite_food_delivery/features/faq/pages/faq_screen.dart';
import 'discovery_scope.dart';
import 'package:bite_food_delivery/features/authentication/pages/login_screen.dart';
import 'package:bite_food_delivery/features/notifications/pages/notification_screen.dart';
import 'package:bite_food_delivery/features/orders/pages/order_history_screen.dart';
import 'package:bite_food_delivery/features/profile/pages/person_info_screen.dart';
import 'package:bite_food_delivery/features/reviews/pages/my_reviews_screen.dart';
import 'package:bite_food_delivery/features/reviews/pages/review_screen.dart';
import 'package:bite_food_delivery/features/settings/pages/setting_screen.dart';
import 'package:bite_food_delivery/features/authentication/pages/signup_screen.dart';
import 'package:bite_food_delivery/features/orders/pages/track_order_screen.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/address_screen': (context) => const AddressScreen(),
  '/person_info_screen': (context) => const PersonInfoScreen(),
  '/all_restaurants_screen': (context) => const AllRestaurantScreen(),
  '/all_categories_screen': (context) => const AllCategoryScreen(),
  '/cart_screen': (context) => const CartScreen(),
  '/order_history_screen': (context) => BlocProvider(
    create: (context) =>
        Di.sl<OrderCubit>(param1: context.read<NotificationsCubit>())
          ..loadOrderHistory(getCurrentUser()?.uid ?? ''),
    child: const OrderHistoryScreen(),
  ),
  '/category_screen': (context) => const DiscoveryScope(),
  '/favourite': (context) => const DiscoveryScope(savedOnly: true),
  '/notification': (context) => const NotificationScreen(),
  '/setting_screen': (context) => const SettingScreen(),
  '/faq_screen': (context) => const FAQScreen(),
  '/add_address_screen': (context) => const AddAddressScreen(),
  '/update_address_screen': (context) => const UpdateAddressScreen(),
  '/restaurant_screen': CatalogRoutes.restaurant,
  '/food_item_screen': CatalogRoutes.food,
  '/login_screen': (context) => BlocProvider(
    create: (context) => Di.sl<RememberMeCubit>(),
    child: const LoginScreen(),
  ),
  '/signup_screen': (context) => const SignupScreen(),
  '/forgot_password_screen': (context) => const ForgotPasswordScreen(),
  '/review_screen': (context) => const ReviewScreen(),
  '/my_reviews_screen': (context) => const MyReviewsScreen(),
  '/payment_screen': (context) {
    return const PaymentScreen();
  },

  '/add_card_screen': (context) => const PaymentScreen(),

  '/checkout_screen': (context) => const CheckoutScope(),

  '/track_order_screen': (context) => BlocProvider(
    create: (_) => Di.sl<PhoneCallCubit>(),
    child: const TrackOrderScreen(),
  ),
};
