import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class HomeIntro extends StatefulWidget {
  const HomeIntro({
    super.key,
    required this.headline,
    required this.subtitle,
  });

  final String headline, subtitle;

  @override
  State<HomeIntro> createState() => _HomeIntroState();
}

class _HomeIntroState extends State<HomeIntro> with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final AnimationController _floatController;
  late final Animation<double> _pulseScale;
  late final Animation<double> _floatY;

  // 3D tilt tracking on promo card
  double _tiltX = 0.0;
  double _tiltY = 0.0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _pulseScale = Tween<double>(begin: 0.9, end: 1.6).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOutCubic),
    );

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _floatY = Tween<double>(begin: -4.0, end: 4.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
    );

    if (!EnvironmentUtils.isTest) {
      _pulseController.repeat(reverse: true);
      _floatController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details, Size size) {
    setState(() {
      final centerX = size.width / 2;
      final centerY = size.height / 2;
      _tiltY = ((details.localPosition.dx - centerX) / centerX).clamp(-1.0, 1.0) * 0.12;
      _tiltX = -((details.localPosition.dy - centerY) / centerY).clamp(-1.0, 1.0) * 0.12;
    });
  }

  void _onPanEnd() {
    setState(() {
      _tiltX = 0.0;
      _tiltY = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Live Radar Kitchen Beacon Pill
        Container(
          constraints: BoxConstraints(maxWidth: 0.85.sw),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h).r,
          decoration: BoxDecoration(
            color: context.appColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20).r,
            border: Border.all(
              color: context.appColors.primary.withValues(alpha: 0.25),
              width: 1.r,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Pulsing green live radar dot
              SizedBox(
                width: 12.r,
                height: 12.r,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseScale,
                      builder: (context, _) => Container(
                        width: 12.r * _pulseScale.value,
                        height: 12.r * _pulseScale.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF00C853).withValues(
                            alpha: (1.6 - _pulseScale.value).clamp(0.0, 0.5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 7.r,
                      height: 7.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00C853),
                      ),
                    ),
                  ],
                ),
              ),
              6.horizontalSpace,
              Flexible(
                child: AppText(
                  '24 KITCHENS LIVE',
                  style: AppTextStyles.labelSmall(context).copyWith(
                    color: context.appColors.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 10.sp,
                    letterSpacing: 0.8,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        8.verticalSpace,
        AppText(
          widget.headline,
          style: AppTextStyles.headlineLarge(
            context,
          ).copyWith(fontWeight: FontWeight.w800),
        ),
        6.verticalSpace,
        AppText(
          widget.subtitle,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: context.appColors.onSurfaceVariant),
        ),
        16.verticalSpace,

        // 3D Arcade Bento Hero Promo Card
        LayoutBuilder(
          builder: (context, constraints) {
            final cardSize = Size(constraints.maxWidth, 140.h);

            return GestureDetector(
              onPanUpdate: (details) => _onPanUpdate(details, cardSize),
              onPanEnd: (_) => _onPanEnd(),
              onPanCancel: () => _onPanEnd(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_tiltX)
                  ..rotateY(_tiltY),
                transformAlignment: FractionalOffset.center,
                child: AppBouncingTap(
                  onTap: () => AppNavigation.push(context, '/all_restaurants_screen'),
                  pressedScale: 0.97,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: dark
                            ? [
                                const Color(0xFFFF6D3A),
                                const Color(0xFFD84315),
                              ]
                            : [
                                const Color(0xFFFF5722),
                                const Color(0xFFFF8A65),
                              ],
                      ),
                      borderRadius: BorderRadius.circular(24).r,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF5722).withValues(alpha: 0.4),
                          blurRadius: 20.r,
                          offset: Offset(0, 8.h),
                        ),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Background atmospheric geometric glow
                        Positioned(
                          right: -25.r,
                          top: -30.r,
                          child: Container(
                            width: 140.r,
                            height: 140.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.12),
                            ),
                          ),
                        ),

                        // Content Row
                        Row(
                          children: [
                            // Left Text & CTA
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Limited Time Tag in Electric Neon Lime from UI kit
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 3.h,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: AppPastelColors.neonLime,
                                      borderRadius: BorderRadius.circular(10).r,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppPastelColors.neonLime.withValues(alpha: 0.35),
                                          blurRadius: 6.r,
                                        ),
                                      ],
                                    ),
                                    child: AppText(
                                      '⚡ 30% OFF',
                                      style: AppTextStyles.labelSmall(context).copyWith(
                                        color: const Color(0xFF141416),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10.sp,
                                        letterSpacing: 0.6,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  6.verticalSpace,
                                  AppText(
                                    'Fresh Hot Bites\nIn 18 Min',
                                    style: AppTextStyles.titleMedium(context).copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15.sp,
                                      height: 1.2,
                                    ),
                                  ),
                                  10.verticalSpace,
                                  // Order Now Pill Button
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF141416),
                                      borderRadius: BorderRadius.circular(22).r,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.28),
                                          blurRadius: 8.r,
                                          offset: Offset(0, 3.h),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: AppText(
                                            'Order now',
                                            style: AppTextStyles.labelMedium(context)
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        5.horizontalSpace,
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 14.r,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            12.horizontalSpace,

                            // Right 3D Floating Dish Showcase
                            Expanded(
                              flex: 4,
                              child: AnimatedBuilder(
                                animation: _floatY,
                                builder: (context, _) => Transform.translate(
                                  offset: Offset(0, _floatY.value),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      // Outer Halo Glow
                                      Container(
                                        width: 78.r,
                                        height: 78.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withValues(alpha: 0.18),
                                        ),
                                      ),
                                      // Central Food Emblem
                                      Container(
                                        width: 66.r,
                                        height: 66.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFFFB74D),
                                              Color(0xFFFF9800),
                                            ],
                                          ),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2.5.r,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.25),
                                              blurRadius: 14.r,
                                              offset: Offset(0, 6.h),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.lunch_dining_rounded,
                                            size: 34.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      // Orbiting Star Badge
                                      Positioned(
                                        top: -2.r,
                                        right: 2.r,
                                        child: Container(
                                          padding: EdgeInsets.all(4.r),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFD700),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.5.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(alpha: 0.2),
                                                blurRadius: 4.r,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.star_rounded,
                                            size: 13.r,
                                            color: const Color(0xFF6D4C00),
                                          ),
                                        ),
                                      ),
                                      // Orbiting Flame Badge
                                      Positioned(
                                        bottom: -2.r,
                                        left: 2.r,
                                        child: Container(
                                          padding: EdgeInsets.all(4.r),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFF3D00),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.5.r,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(alpha: 0.2),
                                                blurRadius: 4.r,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.local_fire_department_rounded,
                                            size: 13.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
