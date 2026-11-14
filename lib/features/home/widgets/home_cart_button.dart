import 'package:bite_food_delivery/widgets/app_fly_to_cart.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class HomeCartButton extends StatefulWidget {
  const HomeCartButton({
    super.key,
    required this.count,
    required this.label,
    required this.onTap,
  });

  final int count;
  final String label;
  final VoidCallback onTap;

  @override
  State<HomeCartButton> createState() => _HomeCartButtonState();
}

class _HomeCartButtonState extends State<HomeCartButton>
    with SingleTickerProviderStateMixin {
  final GlobalKey _cartKey = GlobalKey();
  late final AnimationController _wobbleController;
  late final Animation<double> _wobbleAnimation;

  @override
  void initState() {
    super.initState();
    AppFlyToCart.globalCartKey = _cartKey;
    _wobbleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _wobbleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.28)
            .chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 35,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.28, end: 0.9)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.9, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 35,
      ),
    ]).animate(_wobbleController);
  }

  @override
  void didUpdateWidget(covariant HomeCartButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.count > oldWidget.count) {
      _wobbleController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    if (AppFlyToCart.globalCartKey == _cartKey) {
      AppFlyToCart.globalCartKey = null;
    }
    _wobbleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsetsDirectional.only(end: 16.r),
    child: AppBouncingTap(
      onTap: widget.onTap,
      pressedScale: 0.9,
      child: Semantics(
        label: widget.label,
        button: true,
        child: AnimatedBuilder(
          animation: _wobbleAnimation,
          builder: (context, child) => Transform.scale(
            scale: _wobbleAnimation.value,
            child: child,
          ),
          child: Container(
            key: _cartKey,
            width: 42.r,
            height: 42.r,
            decoration: BoxDecoration(
              color: context.appColors.surfaceContainerHighest.withValues(
                alpha: 0.7,
              ),
              borderRadius: BorderRadius.circular(14).r,
              border: Border.all(
                color: context.appColors.outlineVariant.withValues(alpha: 0.35),
                width: 1.r,
              ),
              boxShadow: widget.count > 0
                  ? [
                      BoxShadow(
                        color: context.appColors.primary.withValues(alpha: 0.18),
                        blurRadius: 10.r,
                        offset: Offset(0, 3.h),
                      ),
                    ]
                  : null,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 20.r,
                  color: context.appColors.onSurface,
                ),
                if (widget.count > 0)
                  Positioned(
                    top: 6.r,
                    right: 6.r,
                    child: AnimatedScale(
                      scale: widget.count > 0 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: context.appColors.primary,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16.r,
                          minHeight: 16.r,
                        ),
                        child: Center(
                          child: AppText(
                            '${widget.count}',
                            style: AppTextStyles.labelSmall(context).copyWith(
                              color: context.appColors.onPrimary,
                              fontSize: 9.sp,
                              height: 1.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
