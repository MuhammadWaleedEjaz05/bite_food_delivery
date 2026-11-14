import 'dart:math' as math;
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSlide extends StatefulWidget {
  final String assetName;
  final String title;
  final String description;
  final Color? pastelColor;
  final IconData? icon;
  final String? badgeText;
  final IconData? badgeIcon;
  final List<FloatingGarnishData> garnishes;

  const OnboardingSlide({
    super.key,
    required this.assetName,
    required this.title,
    required this.description,
    this.pastelColor,
    this.icon,
    this.badgeText,
    this.badgeIcon,
    this.garnishes = const [],
  });

  @override
  State<OnboardingSlide> createState() => _OnboardingSlideState();
}

class _OnboardingSlideState extends State<OnboardingSlide>
    with TickerProviderStateMixin {
  late final AnimationController _floatingController;
  late final AnimationController _tiltSpringController;
  late final AnimationController _tapSquashController;

  double _tiltX = 0.0;
  double _tiltY = 0.0;

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );
    if (!EnvironmentUtils.isTest) {
      _floatingController.repeat(reverse: true);
    }

    _tiltSpringController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _tapSquashController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _tiltSpringController.dispose();
    _tapSquashController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _tiltY = (_tiltY + details.delta.dx * 0.003).clamp(-0.25, 0.25);
      _tiltX = (_tiltX - details.delta.dy * 0.003).clamp(-0.25, 0.25);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final startX = _tiltX;
    final startY = _tiltY;

    _tiltSpringController.reset();
    final animation = CurvedAnimation(
      parent: _tiltSpringController,
      curve: Curves.elasticOut,
    );

    animation.addListener(() {
      setState(() {
        _tiltX = startX * (1 - animation.value);
        _tiltY = startY * (1 - animation.value);
      });
    });

    _tiltSpringController.forward();
  }

  void _onTapDish() {
    _tapSquashController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = dark
        ? colors.surfaceContainerHigh
        : (widget.pastelColor ?? colors.primary.withValues(alpha: 0.08));

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w).r,
      child: Column(
        children: [
          // 1. 3D Parallax Tilt Hero Card
          Expanded(
            child: Center(
              child: GestureDetector(
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                onTap: _onTapDish,
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _floatingController,
                    _tapSquashController,
                  ]),
                  builder: (context, _) {
                    final floatValue = math.sin(
                      _floatingController.value * 2 * math.pi,
                    );
                    final squashValue = _tapSquashController.value;
                    // Squash & stretch physics on tap:
                    final scaleX =
                        1.0 + math.sin(squashValue * math.pi) * 0.12;
                    final scaleY =
                        1.0 - math.sin(squashValue * math.pi) * 0.10;

                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0015) // 3D Perspective depth!
                        ..rotateX(_tiltX)
                        ..rotateY(_tiltY),
                      child: Container(
                        constraints: BoxConstraints(maxHeight: 240.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(36).r,
                          border: Border.all(
                            color: colors.outlineVariant.withValues(
                              alpha: dark ? 0.35 : 0.55,
                            ),
                            width: 1.5.r,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: dark ? 0.45 : 0.06,
                              ),
                              blurRadius: 28.r,
                              offset: Offset(
                                -_tiltY * 30,
                                12.h + (_tiltX * 25),
                              ),
                            ),
                            BoxShadow(
                              color: (widget.pastelColor ?? colors.primary)
                                  .withValues(alpha: dark ? 0.15 : 0.10),
                              blurRadius: 36.r,
                              spreadRadius: 2.r,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36).r,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Interactive Specular Lighting Glare based on 3D Tilt
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(
                                        -1.0 + _tiltY * 2,
                                        -1.0 + _tiltX * 2,
                                      ),
                                      end: Alignment(
                                        1.0 + _tiltY * 2,
                                        1.0 + _tiltX * 2,
                                      ),
                                      colors: [
                                        Colors.white.withValues(
                                          alpha: dark ? 0.08 : 0.45,
                                        ),
                                        Colors.white.withValues(alpha: 0.0),
                                        Colors.black.withValues(
                                          alpha: dark ? 0.25 : 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Outer Glowing Aura Rings
                              Container(
                                width: 175.r + floatValue * 6,
                                height: 175.r + floatValue * 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors.surface.withValues(
                                    alpha: dark ? 0.08 : 0.50,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colors.primary.withValues(
                                        alpha: 0.08,
                                      ),
                                      blurRadius: 24.r,
                                    ),
                                  ],
                                ),
                              ),

                              // Orbiting Floating 3D Garnishes (at different parallax depths)
                              for (
                                var i = 0;
                                i < widget.garnishes.length;
                                i++
                              ) ...[
                                _buildOrbitingGarnish(
                                  widget.garnishes[i],
                                  floatValue,
                                  i,
                                  dark,
                                ),
                              ],

                              // Center Interactive Food Pedestal (Squash & Stretch on Tap)
                              Transform.scale(
                                scaleX: scaleX,
                                scaleY: scaleY,
                                child: Container(
                                  width: 120.r,
                                  height: 120.r,
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
                                              const Color(0xFFFFF9F5),
                                            ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: colors.primary.withValues(
                                          alpha: 0.22,
                                        ),
                                        blurRadius: 20.r,
                                        offset: Offset(0, 8.h + floatValue * 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: widget.icon != null
                                        ? Icon(
                                            widget.icon,
                                            size: 58.r,
                                            color: colors.primary,
                                          )
                                        : (widget.assetName.endsWith('.svg')
                                            ? SvgPicture.asset(
                                                widget.assetName,
                                                height: 58.r,
                                                width: 58.r,
                                                fit: BoxFit.contain,
                                                colorFilter: ColorFilter.mode(
                                                  colors.primary,
                                                  BlendMode.srcIn,
                                                ),
                                              )
                                            : Image.asset(
                                                widget.assetName,
                                                height: 58.r,
                                                width: 58.r,
                                                fit: BoxFit.contain,
                                              )),
                                  ),
                                ),
                              ),

                              // Floating 3D Neon Badge Pill (Bottom)
                              if (widget.badgeText != null)
                                Positioned(
                                  bottom: 14.h,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 6.h,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: dark
                                          ? const Color(0xFF1B191D)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        24,
                                      ).r,
                                      border: Border.all(
                                        color: colors.primary.withValues(
                                          alpha: 0.35,
                                        ),
                                        width: 1.2.r,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: dark ? 0.35 : 0.08,
                                          ),
                                          blurRadius: 12.r,
                                          offset: Offset(0, 4.h),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (widget.badgeIcon != null) ...[
                                          Icon(
                                            widget.badgeIcon,
                                            size: 14.r,
                                            color: colors.primary,
                                          ),
                                          6.horizontalSpace,
                                        ],
                                        AppText(
                                          widget.badgeText!,
                                          style: AppTextStyles.labelSmall(
                                            context,
                                          ).copyWith(
                                            fontWeight: FontWeight.w900,
                                            color: dark
                                                ? Colors.white
                                                : colors.onSurface,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          16.verticalSpace,

          // 2. High-Octane Title with Dynamic Gradient Fill
          AppText(
            widget.title,
            style: AppTextStyles.headlineSmall(
              context,
            ).copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5),
            textAlign: TextAlign.center,
          ),

          8.verticalSpace,

          // 3. Clear Atmospheric Description
          AppText(
            widget.description,
            style: AppTextStyles.bodyMedium(
              context,
            ).copyWith(color: colors.onSurfaceVariant, height: 1.42),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildOrbitingGarnish(
    FloatingGarnishData garnish,
    double float,
    int index,
    bool dark,
  ) {
    // Parallax depth offset
    final offsetMultiplier = 1.0 + (index % 3) * 0.5;
    final yOffset = math.sin((_floatingController.value + (index * 0.25)) * 2 * math.pi) * 8 * offsetMultiplier;

    return Positioned(
      top: garnish.top != null ? garnish.top! + yOffset : null,
      bottom: garnish.bottom != null ? garnish.bottom! - yOffset : null,
      left: garnish.left != null ? garnish.left! + (_tiltY * 18 * offsetMultiplier) : null,
      right: garnish.right != null ? garnish.right! - (_tiltY * 18 * offsetMultiplier) : null,
      child: Container(
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(
          color: dark ? const Color(0xFF221E24) : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: garnish.color.withValues(alpha: 0.4),
            width: 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: garnish.color.withValues(alpha: 0.30),
              blurRadius: 10.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Icon(garnish.icon, size: 16.r, color: garnish.color),
      ),
    );
  }
}

class FloatingGarnishData {
  final IconData icon;
  final Color color;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const FloatingGarnishData({
    required this.icon,
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
}
