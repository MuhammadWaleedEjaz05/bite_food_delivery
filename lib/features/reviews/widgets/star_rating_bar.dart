import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingBar extends StatefulWidget {
  final double rating;
  final ValueChanged<double>? onRatingChanged;
  final double? size;
  final Color? activeColor;
  final Color? inactiveColor;
  final double spacing;

  const StarRatingBar({
    super.key,
    required this.rating,
    this.onRatingChanged,
    this.size,
    this.activeColor,
    this.inactiveColor,
    this.spacing = 4,
  });

  @override
  State<StarRatingBar> createState() => _StarRatingBarState();
}

class _StarRatingBarState extends State<StarRatingBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _bounceController;
  int _lastTappedIndex = -1;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  void _handleTap(int index, double starValue) {
    setState(() => _lastTappedIndex = index);
    _bounceController.forward(from: 0.0);
    widget.onRatingChanged?.call(starValue);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final starSize = widget.size ?? 28.r;
    final effectiveActiveColor = widget.activeColor ?? const Color(0xFFFFB800);
    final effectiveInactiveColor =
        widget.inactiveColor ?? colors.outlineVariant.withValues(alpha: 0.6);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        final isFilled = widget.rating >= starValue;
        final isHalf = !isFilled && widget.rating >= (starValue - 0.5);

        final icon = isFilled
            ? Icons.star_rounded
            : isHalf
            ? Icons.star_half_rounded
            : Icons.star_outline_rounded;

        final color = (isFilled || isHalf)
            ? effectiveActiveColor
            : effectiveInactiveColor;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: (widget.spacing / 2).r),
          child: InkResponse(
            onTap: widget.onRatingChanged != null
                ? () => _handleTap(index, starValue)
                : null,
            radius: starSize,
            child: AnimatedBuilder(
              animation: _bounceController,
              builder: (context, child) {
                final isTarget = index == _lastTappedIndex;
                final scale = isTarget
                    ? 1.0 + (0.28 * (1.0 - _bounceController.value))
                    : 1.0;
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: Icon(icon, size: starSize, color: color),
            ),
          ),
        );
      }),
    );
  }
}
