import 'package:bite_food_delivery/src/features/splash_and_onboarding/cubits/first_time_launch_cubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/src/features/splash_and_onboarding/pages/onboarding_screen.dart';
import 'package:bite_food_delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final FirstTimeLaunchCubit _firstTimeLaunchCubit = FirstTimeLaunchCubit();
  late AnimationController _controller;
  late AnimationController _logoAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    _firstTimeLaunchCubit.checkFirstTimeLaunch();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _logoAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    scaleAnimation = Tween<double>(
      begin: 1,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _logoAnimation, curve: Curves.easeInCubic),
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoAnimation.forward();
      }
    });
    _logoAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 2), () {
          _logoAnimation.reverse().then((_) {
            if (_firstTimeLaunchCubit.state is FirstTimeLaunched) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Stack(
            children: [
              Center(
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: SvgPicture.asset(
                    'assets/svgs/logo.svg',
                    height: 200.h,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -100.w,
                top: -100.h,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: SvgPicture.asset(
                    'assets/svgs/circle.svg',
                    height: 200.h,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSecondaryFixed,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -100.w,
                bottom: -100.h,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: SvgPicture.asset(
                    'assets/svgs/circle.svg',
                    height: 200.h,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
