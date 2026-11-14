import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

enum CalloutPointerDirection { left, right }

class FoodCalloutBadge extends StatefulWidget {
  const FoodCalloutBadge({
    super.key,
    required this.label,
    required this.backgroundColor,
    this.pointerDirection = CalloutPointerDirection.right,
    this.floatOffset = 3.0,
  });

  final String label;
  final Color backgroundColor;
  final CalloutPointerDirection pointerDirection;
  final double floatOffset;

  @override
  State<FoodCalloutBadge> createState() => _FoodCalloutBadgeState();
}

class _FoodCalloutBadgeState extends State<FoodCalloutBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _animation = Tween<double>(
      begin: -widget.floatOffset,
      end: widget.floatOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine));

    if (!EnvironmentUtils.isTest) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPointingRight =
        widget.pointerDirection == CalloutPointerDirection.right;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _animation.value),
        child: child,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isPointingRight) ...[
            _PointerDot(color: widget.backgroundColor),
            4.horizontalSpace,
          ],
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h).r,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(16).r,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 8.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            child: AppText(
              widget.label,
              style: AppTextStyles.labelSmall(context).copyWith(
                color: const Color(0xFF141416),
                fontWeight: FontWeight.w800,
                fontSize: 10.5.sp,
              ),
            ),
          ),
          if (isPointingRight) ...[
            4.horizontalSpace,
            _PointerDot(color: widget.backgroundColor),
          ],
        ],
      ),
    );
  }
}

class _PointerDot extends StatelessWidget {
  const _PointerDot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.r,
      height: 7.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: color, width: 2.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4.r,
          ),
        ],
      ),
    );
  }
}
