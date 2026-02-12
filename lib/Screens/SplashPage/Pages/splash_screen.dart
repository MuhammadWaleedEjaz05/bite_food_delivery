import 'package:bite_food_delivery/Screens/OnboardingPage/Page/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const OnboardingScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                transitionDuration: const Duration(milliseconds: 600),
              ),
            );
          }
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
                    child: Image.asset(
                      "assets/images/logo.png",
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
