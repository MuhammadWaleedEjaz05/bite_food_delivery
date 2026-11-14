import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/app/theme/app_theme.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/features/food_items/widgets/food_callout_badge.dart';

class FoodTurntableDisplay extends StatefulWidget {
  const FoodTurntableDisplay({
    super.key,
    required this.imageUrl,
    this.initialRotation = 0.0,
  });

  final String imageUrl;
  final double initialRotation;

  @override
  State<FoodTurntableDisplay> createState() => _FoodTurntableDisplayState();
}

class _FoodTurntableDisplayState extends State<FoodTurntableDisplay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;
  late final Animation<double> _floatY;

  double _rotationY = 0.0;
  double _tiltX = 0.0;

  @override
  void initState() {
    super.initState();
    _rotationY = widget.initialRotation;

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );
    _floatY = Tween<double>(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOutSine),
    );

    if (!EnvironmentUtils.isTest) {
      _floatController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _rotationY += details.delta.dx * 0.015;
      _tiltX = (_tiltX - details.delta.dy * 0.01).clamp(-0.25, 0.25);
    });
  }

  void _onPanEnd() {
    setState(() {
      // Settle tilt gently back to level
      _tiltX = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF1E2820) : const Color(0xFFDCEFD9),
        borderRadius: BorderRadius.circular(28).r,
        border: Border.all(
          color: dark
              ? Colors.white.withValues(alpha: 0.08)
              : const Color(0xFFC8E6C9),
          width: 1.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: dark ? 0.32 : 0.06),
            blurRadius: 18.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: (_) => _onPanEnd(),
        onPanCancel: () => _onPanEnd(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ambient Radial Dish Saucer Glow
            Positioned(
              bottom: 14.h,
              child: Container(
                width: 160.w,
                height: 32.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(180.w, 38.h)),
                  color: dark
                      ? Colors.black.withValues(alpha: 0.45)
                      : const Color(0xFFA5D6A7).withValues(alpha: 0.55),
                  boxShadow: [
                    BoxShadow(
                      color: dark
                          ? Colors.black.withValues(alpha: 0.6)
                          : const Color(0xFF81C784).withValues(alpha: 0.45),
                      blurRadius: 18.r,
                      spreadRadius: 4.r,
                    ),
                  ],
                ),
              ),
            ),

            // Top-Left Floating Badge: Organic
            Positioned(
              top: 14.h,
              left: 14.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h).r,
                decoration: BoxDecoration(
                  color: dark
                      ? const Color(0xFF141416).withValues(alpha: 0.85)
                      : Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(16).r,
                  border: Border.all(
                    color: dark
                        ? Colors.white.withValues(alpha: 0.12)
                        : Colors.black.withValues(alpha: 0.06),
                    width: 1.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.eco_rounded,
                      size: 13.r,
                      color: const Color(0xFF43A047),
                    ),
                    4.horizontalSpace,
                    AppText(
                      '100% FRESH',
                      style: AppTextStyles.labelSmall(context).copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w800,
                        color: dark ? Colors.white : const Color(0xFF2E7D32),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top-Right Floating Badge: Chef Pick
            Positioned(
              top: 14.h,
              right: 14.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h).r,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5722),
                  borderRadius: BorderRadius.circular(16).r,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF5722).withValues(alpha: 0.35),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_fire_department_rounded,
                      size: 13.r,
                      color: Colors.white,
                    ),
                    3.horizontalSpace,
                    AppText(
                      'CHEF PICK',
                      style: AppTextStyles.labelSmall(context).copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 3D Perspective Floating Dish
            AnimatedBuilder(
              animation: _floatY,
              builder: (context, _) => Transform.translate(
                offset: Offset(0, _floatY.value),
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(_tiltX)
                    ..rotateY(_rotationY),
                  child: AppNetworkImage(
                    url: widget.imageUrl,
                    height: 145.r,
                    width: 200.w,
                    radius: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Dynamic Callout Badges with pointer anchored to the food (from UI kit)
            Positioned(
              left: 10.r,
              top: 32.h,
              child: const FoodCalloutBadge(
                label: 'Full of protein',
                backgroundColor: AppPastelColors.blushPeach,
                pointerDirection: CalloutPointerDirection.right,
              ),
            ),
            Positioned(
              right: 10.r,
              bottom: 32.h,
              child: const FoodCalloutBadge(
                label: 'Popular',
                backgroundColor: Color(0xFFFFD8D4),
                pointerDirection: CalloutPointerDirection.left,
              ),
            ),

            // Bottom-Right 360° Drag Hint
            Positioned(
              bottom: 12.h,
              right: 14.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h).r,
                decoration: BoxDecoration(
                  color: dark
                      ? const Color(0xFF141416).withValues(alpha: 0.75)
                      : Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(14).r,
                  border: Border.all(
                    color: dark
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.06),
                    width: 1.r,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.sync_rounded,
                      size: 12.r,
                      color: dark ? Colors.white70 : const Color(0xFF555555),
                    ),
                    4.horizontalSpace,
                    AppText(
                      'Spin 360°',
                      style: AppTextStyles.labelSmall(context).copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        color: dark ? Colors.white70 : const Color(0xFF555555),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
