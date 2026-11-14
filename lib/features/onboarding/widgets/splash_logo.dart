import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashLogo extends StatefulWidget {
  final Animation<double> opacityAnimation;

  const SplashLogo({super.key, required this.opacityAnimation});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;
  late final Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    if (!EnvironmentUtils.isTest) {
      _pulseController.repeat(reverse: true);
    }

    _pulseAnimation = Tween<double>(begin: 0.96, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutSine),
    );

    _rotateAnimation = Tween<double>(begin: -0.04, end: 0.04).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: FadeTransition(
        opacity: widget.opacityAnimation,
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, _) {
            final pulse = _pulseAnimation.value;
            final rotate = _rotateAnimation.value;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Multi-layered Sizzling Hero Stage
                Transform.scale(
                  scale: pulse,
                  child: Transform.rotate(
                    angle: rotate,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Outer Radiant Neon Energy Shockwave
                        Container(
                          width: 170.r,
                          height: 170.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                colors.primary.withValues(
                                  alpha: dark ? 0.45 : 0.28,
                                ),
                                const Color(0xFFFF9100).withValues(
                                  alpha: dark ? 0.20 : 0.12,
                                ),
                                colors.primary.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),

                        // Orbiting Flying Flavor Particle Pills (Top & Bottom)
                        Positioned(
                          top: -6.h,
                          right: -10.w,
                          child: const _FloatingIngredientBadge(
                            icon: Icons.local_fire_department_rounded,
                            color: Color(0xFFFF5722),
                            label: 'FLAME',
                          ),
                        ),
                        Positioned(
                          bottom: -6.h,
                          left: -12.w,
                          child: const _FloatingIngredientBadge(
                            icon: Icons.bolt_rounded,
                            color: Color(0xFFFFB800),
                            label: 'FRESH',
                          ),
                        ),

                        // Center 3D Glassmorphic Emblem Disc
                        Container(
                          width: 116.r,
                          height: 116.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: dark
                                  ? [
                                      colors.surfaceContainerHighest,
                                      colors.surfaceContainerLow,
                                    ]
                                  : [
                                      Colors.white,
                                      const Color(0xFFFFF4EC),
                                    ],
                            ),
                            border: Border.all(
                              color: colors.primary.withValues(
                                alpha: dark ? 0.5 : 0.35,
                              ),
                              width: 2.5.r,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colors.primary.withValues(
                                  alpha: dark ? 0.55 : 0.28,
                                ),
                                blurRadius: 36.r,
                                spreadRadius: 4.r,
                                offset: Offset(0, 10.h),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svgs/logo.svg',
                              height: 64.r,
                              width: 64.r,
                              colorFilter: ColorFilter.mode(
                                colors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                28.verticalSpace,

                // 2. High-Impact Futuristic Title
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      colors.primary,
                      const Color(0xFFFF6D3A),
                      const Color(0xFFFFB800),
                    ],
                  ).createShader(bounds),
                  child: AppText(
                    'BITE',
                    style: AppTextStyles.headlineLarge(context).copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 8.0,
                      fontSize: 38.sp,
                      color: Colors.white,
                    ),
                  ),
                ),

                8.verticalSpace,

                // 3. Neon Capsule Tagline
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 5.h,
                  ).r,
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(24).r,
                    border: Border.all(
                      color: colors.primary.withValues(
                        alpha: dark ? 0.35 : 0.25,
                      ),
                      width: 1.r,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.restaurant_rounded,
                        size: 13.r,
                        color: colors.primary,
                      ),
                      6.horizontalSpace,
                      AppText(
                        'FEAST UNLEASHED • FUTURE FOOD',
                        style: AppTextStyles.labelSmall(context).copyWith(
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w800,
                          color: colors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FloatingIngredientBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _FloatingIngredientBadge({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h).r,
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF1F1A1B) : Colors.white,
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 10.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.r, color: color),
          4.horizontalSpace,
          AppText(
            label,
            style: AppTextStyles.labelSmall(context).copyWith(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
