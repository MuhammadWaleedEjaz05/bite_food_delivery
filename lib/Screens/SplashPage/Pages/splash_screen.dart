import 'dart:async';

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
  static const Duration _kAnimationDuration = Duration(milliseconds: 5000);
  static const Duration _kNavigationDelay = Duration(milliseconds: 500);
  static const Duration _kLaunchStateTimeout = Duration(seconds: 2);
  static const Duration _kFallbackTimeout = Duration(seconds: 4);

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _circleFadeAnimation;
  late Animation<double> _logoFadeAnimation;
  Timer? _fallbackTimer;
  bool _didNavigate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _kAnimationDuration,
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
      curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
    );
    _controller.addStatusListener(_handleAnimationStatus);
    _controller.forward();
    _fallbackTimer = Timer(_kFallbackTimeout, _resolveLaunchState);
  }

  Future<void> _handleAnimationStatus(AnimationStatus status) async {
    if (status != AnimationStatus.completed) {
      return;
    }
    await _resolveLaunchState();
  }

  Future<void> _resolveLaunchState() async {
    if (_didNavigate || !mounted) return;

    final FirstTimeLaunchCubit cubit = context.read<FirstTimeLaunchCubit>();
    FirstTimeLaunchState state = cubit.state;

    if (state is FirstTimeLaunchInitial) {
      unawaited(cubit.checkFirstTimeLaunch());
      try {
        state = await cubit.stream
            .firstWhere((state) => state is! FirstTimeLaunchInitial)
            .timeout(_kLaunchStateTimeout);
      } on TimeoutException {
        state = const FirstTimeLaunchError(
          errorMessage: 'Timed out while resolving launch state.',
        );
      }
    }

    if (state is FirstTimeLaunchError) {
      state = NotFirstTimeLaunched();
    }

    _didNavigate = true;
    _fallbackTimer?.cancel();
    await Future<void>.delayed(_kNavigationDelay);
    if (!mounted) return;

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
            return FadeTransition(
              opacity: ReverseAnimation(secondaryAnimation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    } else if (state is NotFirstTimeLaunched) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: ReverseAnimation(secondaryAnimation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          transitionDuration: const Duration(milliseconds: 1000),
        ),
      );
    }
  }

  @override
  void dispose() {
    _fallbackTimer?.cancel();
    _controller.removeStatusListener(_handleAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double scale = 1.0 + (3.5 * _scaleAnimation.value);
          final double circleOpacity = 1.0 - _circleFadeAnimation.value;
          final double logoFade = _logoFadeAnimation.value;
          final double logoScale = 0.92 + (0.08 * _logoFadeAnimation.value);

          return Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.surface,
                        colorScheme.surfaceContainerLowest,
                      ],
                    ),
                  ),
                ),
              ),
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
                    child: SvgPicture.asset(
                      'assets/svgs/logo.svg',
                      height: 200.h,
                      width: 200.w,
                    ),
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
