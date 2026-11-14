import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';
import 'package:bite_food_delivery/widgets/app_stepper_pill.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class CartLineCard extends StatelessWidget {
  const CartLineCard({
    super.key,
    required this.name,
    required this.options,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.quantityLabel,
    required this.increaseLabel,
    required this.decreaseLabel,
    required this.onIncrease,
    required this.onDecrease,
  });
  final String name,
      options,
      imageUrl,
      price,
      quantityLabel,
      increaseLabel,
      decreaseLabel;
  final int quantity;
  final VoidCallback? onIncrease, onDecrease;

  Color _pastelBg(bool dark) {
    final hash = name.codeUnits.fold(0, (a, b) => a + b);
    if (dark) {
      final darkPastels = [
        const Color(0xFF1B271F),
        const Color(0xFF192330),
        const Color(0xFF292419),
        const Color(0xFF2A1E1A),
      ];
      return darkPastels[hash % darkPastels.length];
    } else {
      final lightPastels = [
        const Color(0xFFE9F6EE),
        const Color(0xFFEBF3FE),
        const Color(0xFFFEF8E7),
        const Color(0xFFFFEFEA),
      ];
      return lightPastels[hash % lightPastels.length];
    }
  }

  Color _pastelBorder(bool dark) {
    final hash = name.codeUnits.fold(0, (a, b) => a + b);
    if (dark) {
      final darkBorders = [
        const Color(0xFF2E4535),
        const Color(0xFF283B4E),
        const Color(0xFF453D28),
        const Color(0xFF442E28),
      ];
      return darkBorders[hash % darkBorders.length];
    } else {
      final lightBorders = [
        const Color(0xFFC7EBD4),
        const Color(0xFFCCE1FD),
        const Color(0xFFF7E6B8),
        const Color(0xFFFBD4C7),
      ];
      return lightBorders[hash % lightBorders.length];
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final bg = _pastelBg(dark);
    final border = _pastelBorder(dark);

    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(22).r,
        border: Border.all(color: border, width: 1.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: dark ? 0.25 : 0.04),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(14.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: dark ? 0.08 : 0.7),
                  borderRadius: BorderRadius.circular(16).r,
                ),
                padding: EdgeInsets.all(4.r),
                child: AppNetworkImage(
                  url: imageUrl,
                  width: 64.r,
                  height: 64.r,
                  radius: 12,
                  fit: BoxFit.contain,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      name,
                      style: AppTextStyles.titleMedium(
                        context,
                      ).copyWith(fontWeight: FontWeight.w800, fontSize: 15.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (options.isNotEmpty) ...[
                      4.verticalSpace,
                      AppText(
                        options,
                        style: AppTextStyles.bodySmall(
                          context,
                        ).copyWith(
                          color: dark
                              ? Colors.white.withValues(alpha: 0.65)
                              : const Color(0xFF666666),
                          fontSize: 11.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.r,
            runSpacing: 6.r,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h).r,
                decoration: BoxDecoration(
                  color: dark ? const Color(0xFF141416) : Colors.white,
                  borderRadius: BorderRadius.circular(14).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 4.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: AppText(
                  price,
                  style: AppTextStyles.labelMedium(context).copyWith(
                    color: dark ? Colors.white : const Color(0xFF141416),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              AppStepperPill(
                quantity: quantity,
                compact: true,
                onIncrease: onIncrease,
                onDecrease: onDecrease,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
