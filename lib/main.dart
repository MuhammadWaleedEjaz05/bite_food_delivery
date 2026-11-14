import 'package:bite_food_delivery/features/orders/bloc/order_cubit.dart';
import 'package:bite_food_delivery/features/favourites/bloc/favourite_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:bite_food_delivery/features/cart/bloc/cart_cubit.dart';
import 'package:bite_food_delivery/core/di/di.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/notifications/bloc/notifications_cubit.dart';
import 'package:bite_food_delivery/features/settings/bloc/settings_cubit.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/app/bloc_providers.dart';
import 'package:bite_food_delivery/core/services/firebase/fcm_initialize.dart';
import 'package:bite_food_delivery/core/services/firebase/firebase_auth_conn.dart';
import 'package:bite_food_delivery/core/utils/shared_preference_functions.dart';
import 'package:bite_food_delivery/app/constants/stripe_const.dart';
import 'package:bite_food_delivery/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);
  if (stripePublishableKey.isNotEmpty) {
    Stripe.publishableKey = stripePublishableKey;
  }
  await initSharedPreferences();
  Di.configure(
    database: FirebaseFirestore.instance,
    preferences: await SharedPreferences.getInstance(),
  );
  await Future.wait([
    if (stripePublishableKey.isNotEmpty) Stripe.instance.applySettings(),
    NotificationService.instance.initialize(),
    initializeFCM(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviderList,
      child: BlocListener<UserAuthCubit, UserAuthState>(
        listener: (context, state) {
          if (state is UserLoggedOut) {
            context.read<FavouriteCubit>().bindUser(null);
            context.read<CartCubit>().clearSession();
            context.read<OrderCubit>().clearSession();
            Di.sl<GoRouter>().refresh();
          }
          if (state is UserLoggedIn) {
            final user = getCurrentUser();
            if (user != null) {
              context.read<FavouriteCubit>().bindUser(user.uid);
              context.read<AddressCubit>().loadAddresses();
              context.read<CartCubit>().initialize(user.uid);
              context.read<NotificationsCubit>().loadNotifications(user.uid);
            }
          }
        },
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp.router(
              theme: AppTheme.build(
                brightness: Brightness.light,
                accentIndex: context.watch<SettingsCubit>().state.themeIndex,
              ),
              darkTheme: AppTheme.build(
                brightness: Brightness.dark,
                accentIndex: context.watch<SettingsCubit>().state.themeIndex,
              ),
              themeMode: context.watch<SettingsCubit>().state.isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routerConfig: Di.sl<GoRouter>(),
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(context.watch<SettingsCubit>().state.languageCode),
              localizationsDelegates: const [
                ...AppLocalizations.localizationsDelegates,
                FormBuilderLocalizations.delegate,
              ],
            );
          },
        ),
      ),
    );
  }
}
