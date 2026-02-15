import 'package:bite_food_delivery/Cubits/BottomNavigationSelection/bottom_navigation_selector_cubit.dart';
import 'package:bite_food_delivery/Cubits/CartCubit/cart_cubit.dart';
import 'package:bite_food_delivery/Cubits/CategoriesCubit/categories_cubit.dart';
import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Screens/SplashPage/Pages/splash_screen.dart';
import 'package:bite_food_delivery/Themes/light_themes.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_bottom_navigation_bar.dart';
import 'package:bite_food_delivery/configs/page_routes.dart';
import 'package:bite_food_delivery/configs/screen_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoriesCubit()),
        BlocProvider(create: (context) => RestaurantsCubit()),
        BlocProvider(create: (context) => RecentSearchesCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => BottomNavigationSelectorCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            routes: routes,
            debugShowCheckedModeBanner: false,
            theme: lightorangeTheme,
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:
          BlocBuilder<
            BottomNavigationSelectorCubit,
            BottomNavigationSelectorState
          >(
            builder: (context, state) {
              return screenList[state is BottomNavigationSelectorChanged
                      ? state.selectedIndex
                      : 0]
                  .page!;
            },
          ),
      bottomNavigationBar: BiteBottomNavigationBar(),
    );
  }
}
