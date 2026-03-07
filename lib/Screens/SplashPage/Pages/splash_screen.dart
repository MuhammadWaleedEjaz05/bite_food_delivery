import 'package:bite_food_delivery/Cubits/FirstTimeLaunchCubit/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/Screens/OnboardingPage/Page/onboarding_screen.dart';
import 'package:bite_food_delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _circleFadeAnimation;
  late Animation<double> _logoFadeAnimation;
  bool _didNavigate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.55, curve: Curves.easeInOutCubic),
    );
    _circleFadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 0.75, curve: Curves.easeOut),
    );
    _logoFadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.75, 0.92, curve: Curves.easeIn),
    );
    _controller.addStatusListener(_handleAnimationStatus);
    _controller.forward();
  }

  Future<void> _handleAnimationStatus(AnimationStatus status) async {
    if (status != AnimationStatus.completed || _didNavigate) {
      return;
    }
    _didNavigate = true;
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;

    final FirstTimeLaunchCubit cubit = context.read<FirstTimeLaunchCubit>();
    FirstTimeLaunchState state = cubit.state;
    if (state is FirstTimeLaunchInitial) {
      state = await cubit.stream.firstWhere(
        (state) => state is! FirstTimeLaunchInitial,
      );
    }
    _navigateToOnState(state);
  }

  void _navigateToOnState(FirstTimeLaunchState state) {
    if (state is FirstTimeLaunched) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } else if (state is NotFirstTimeLaunched) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_handleAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double scale = 1.0 + (3.5 * _scaleAnimation.value);
          final double circleOpacity = 1.0 - _circleFadeAnimation.value;
          final double logoFade = _logoFadeAnimation.value;
          final double logoScale = 0.5 + (0.5 * logoFade);

          return Stack(
            children: [
              Positioned(
                left: -30.w,
                top: -30.h,
                child: Opacity(
                  opacity: circleOpacity,
                  child: Transform.scale(
                    scale: scale,
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/images/Circle1.png",
                      height: 200.h,
                      width: 200.w,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -30.w,
                bottom: -30.h,
                child: Opacity(
                  opacity: circleOpacity,
                  child: Transform.scale(
                    scale: scale,
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/images/Circle2.png",
                      height: 200.h,
                      width: 200.w,
                    ),
                  ),
                ),
              ),
              Center(
                child: Opacity(
                  opacity: logoFade,
                  child: Transform.scale(
                    scale: logoScale,
                    child: SvgPicture.asset('assets/svgs/logo.svg',height: 200.h,width:200.w)
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
