import 'package:bite_food_delivery/Cubits/BottomNavigationSelection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Cubits/SettingsCubit/settings_cubit.dart';
import 'package:bite_food_delivery/Cubits/UpdateCheckCubit/update_check_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_update_dialog.dart';
import 'package:bite_food_delivery/Screens/SplashPage/Pages/splash_screen.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_bottom_navigation_bar.dart';
import 'package:bite_food_delivery/configs/bloc_provider_list.dart';
import 'package:bite_food_delivery/configs/fcm_initialize.dart';
import 'package:bite_food_delivery/configs/page_routes.dart';
import 'package:bite_food_delivery/configs/screen_list.dart';
import 'package:bite_food_delivery/configs/shared_preference_functions.dart';
import 'package:bite_food_delivery/configs/stripe_const.dart';
import 'package:bite_food_delivery/configs/theme_list.dart';
import 'package:bite_food_delivery/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await sharedPreference;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);
  await initializeFCM();
  await NotificationService.instance.initialize();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviderList,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            theme:
                biteLightThemes[context
                    .watch<SettingsCubit>()
                    .state
                    .themeIndex],
            darkTheme:
                biteDarkThemes[context.watch<SettingsCubit>().state.themeIndex],
            themeMode: context.watch<SettingsCubit>().state.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: routes,
            debugShowCheckedModeBanner: false,
            supportedLocales: FormBuilderLocalizations.supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              FormBuilderLocalizations.delegate,
            ],
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<UpdateCheckCubit, UpdateCheckState>(
        listener: (context, state) {
          if (state is UpdateRequired) {
            BiteUpdateDialog.show(
              context,
              latestVersion: state.latestVersion,
              updateUrl: state.updateUrl,
            );
          }
        },
        child:
            BlocBuilder<
              BottomNavigationSelectorCubit,
              BottomNavigationSelectorState
            >(
              builder: (context, state) {
                final selectedIndex = state is BottomNavigationSelectorChanged
                    ? state.selectedIndex
                    : 0;
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey(selectedIndex),
                    child: screenList[selectedIndex].page,
                  ),
                );
              },
            ),
      ),
      floatingActionButton: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final hasActive = context.read<OrderCubit>().hasActiveOrder;
          if (!hasActive) return const SizedBox.shrink();
          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushNamed('/track_order_screen');
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.delivery_dining, color: Colors.white),
            label: Text(
              'Track Order',
              style: GoogleFonts.sen(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BiteBottomNavigationBar(),
    );
  }
}
