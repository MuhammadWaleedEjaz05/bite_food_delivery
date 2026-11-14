import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final starSize = size ?? 28.r;
    final effectiveActiveColor = activeColor ?? colors.primary;
    final effectiveInactiveColor =
        inactiveColor ?? colors.outlineVariant.withValues(alpha: 0.6);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        final isFilled = rating >= starValue;
        final isHalf = !isFilled && rating >= (starValue - 0.5);

        final icon = isFilled
            ? Icons.star_rounded
            : isHalf
            ? Icons.star_half_rounded
            : Icons.star_outline_rounded;

        final color = (isFilled || isHalf)
            ? effectiveActiveColor
            : effectiveInactiveColor;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: (spacing / 2).r),
          child: InkResponse(
            onTap: onRatingChanged != null
                ? () => onRatingChanged!(starValue)
                : null,
            radius: starSize,
            child: Icon(icon, size: starSize, color: color),
          ),
        );
      }),
    );
  }
}
