import 'package:bite_food_delivery/Cubits/BottomNavigationSelection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/OrderCubit/order_cubit.dart';
import 'package:bite_food_delivery/Screens/SplashPage/Pages/splash_screen.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_bottom_navigation_bar.dart';
import 'package:bite_food_delivery/configs/blocProviderlist.dart';
import 'package:bite_food_delivery/configs/fcm_initialize.dart';
import 'package:bite_food_delivery/configs/page_routes.dart';
import 'package:bite_food_delivery/configs/screen_list.dart';
import 'package:bite_food_delivery/configs/shared_preference_fucntions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedPreference;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);
  await initializeFCM();
  await NotificationService.instance.initialize();
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
      backgroundColor: Colors.white,
      body:
          BlocBuilder<
            BottomNavigationSelectorCubit,
            BottomNavigationSelectorState
          >(
            builder: (context, state) {
              return screenList[state is BottomNavigationSelectorChanged
                      ? state.selectedIndex
                      : 0]
                  .page;
            },
          ),
      floatingActionButton: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final hasActive = context.read<OrderCubit>().hasActiveOrder;
          if (!hasActive) return const SizedBox.shrink();
          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushNamed('/track_order_screen');
            },
            backgroundColor: Colors.deepOrange,
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
