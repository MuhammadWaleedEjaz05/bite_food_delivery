import 'package:bite_food_delivery/features/onboarding/bloc/first_time_launch_cubit.dart';
import 'package:bite_food_delivery/features/onboarding/bloc/first_time_launch_state.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/splash_background.dart';
import 'package:bite_food_delivery/features/onboarding/widgets/splash_logo.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashContentSection extends StatefulWidget {
  const SplashContentSection({super.key});

  @override
  State<SplashContentSection> createState() => _SplashContentSectionState();
}

class _SplashContentSectionState extends State<SplashContentSection>
    with TickerProviderStateMixin {
  late final AnimationController _circleController;
  late final AnimationController _logoController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    context.read<FirstTimeLaunchCubit>().checkFirstTimeLaunch();

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 20).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.easeInCubic),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeInCubic),
    );

    _circleController.forward();

    _circleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoController.forward();
      }
    });

    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (!mounted) return;
          _logoController.reverse().then((_) {
            if (!mounted) return;
            final cubit = context.read<FirstTimeLaunchCubit>();
            if (cubit.state is FirstTimeLaunched) {
              context.go('/onboarding');
            } else {
              context.go('/home');
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _circleController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _circleController,
      builder: (context, _) {
        return Stack(
          children: [
            SplashBackground(scaleAnimation: _scaleAnimation),
            SplashLogo(opacityAnimation: _opacityAnimation),
          ],
        );
      },
    );
  }
}
