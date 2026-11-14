import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_bouncing_tap.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';

class AppFoodCard extends StatelessWidget {
  const AppFoodCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    required this.availabilityLabel,
    this.available = true,
    this.compact = false,
    this.favouriteButton,
  });

  final String name, subtitle, price, imageUrl, availabilityLabel;
  final bool available, compact;
  final VoidCallback onTap;
  final Widget? favouriteButton;

  Color _pastelBg(bool dark) {
    final hash = name.codeUnits.fold(0, (a, b) => a + b);
    if (dark) {
      final darkPastels = [
        const Color(0xFF1B271F), // Mint
        const Color(0xFF192330), // Blue
        const Color(0xFF292419), // Butter
        const Color(0xFF2A1E1A), // Peach
      ];
      return darkPastels[hash % darkPastels.length];
    } else {
      final lightPastels = [
        const Color(0xFFE9F6EE), // Pastel Mint Green
        const Color(0xFFEBF3FE), // Pastel Powder Blue
        const Color(0xFFFEF8E7), // Pastel Butter Yellow
        const Color(0xFFFFEFEA), // Pastel Soft Peach
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

    return AppBouncingTap(
      onTap: onTap,
      pressedScale: 0.96,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(24).r,
          border: Border.all(color: border, width: 1.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.3 : 0.05),
              blurRadius: 14.r,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: compact
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _FoodCardCopy(
                        name: name,
                        subtitle: subtitle,
                        price: price,
                        available: available,
                        availabilityLabel: availabilityLabel,
                        compact: true,
                      ),
                    ),
                    8.horizontalSpace,
                    Stack(
                      children: [
                        Container(
                          width: 76.r,
                          height: 76.r,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(
                              alpha: dark ? 0.08 : 0.65,
                            ),
                            borderRadius: BorderRadius.circular(18).r,
                          ),
                          child: Center(
                            child: AppNetworkImage(
                              url: imageUrl,
                              width: 66.r,
                              height: 66.r,
                              radius: 14,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        if (favouriteButton != null)
                          Positioned(
                            top: 4.r,
                            right: 4.r,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.38),
                                shape: BoxShape.circle,
                              ),
                              child: favouriteButton!,
                            ),
                          ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Floating Dish Stage
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Subtle saucer plate shadow
                        Positioned(
                          bottom: 4.h,
                          child: Container(
                            width: 100.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(100.w, 20.h),
                              ),
                              color: Colors.black.withValues(
                                alpha: dark ? 0.35 : 0.08,
                              ),
                            ),
                          ),
                        ),
                        // Food Image
                        AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Center(
                            child: AppNetworkImage(
                              url: imageUrl,
                              width: double.infinity,
                              radius: 14,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Top-Right Favorite Button
                        if (favouriteButton != null)
                          Positioned(
                            top: 4.r,
                            right: 4.r,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.32),
                                shape: BoxShape.circle,
                              ),
                              child: favouriteButton!,
                            ),
                          ),
                        // Top-Left Rating Pill
                        Positioned(
                          top: 4.r,
                          left: 4.r,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7.w,
                              vertical: 3.h,
                            ).r,
                            decoration: BoxDecoration(
                              color: dark
                                  ? const Color(0xFF141416).withValues(alpha: 0.8)
                                  : Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(12).r,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 4.r,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 13.r,
                                  color: const Color(0xFFFFB800),
                                ),
                                3.horizontalSpace,
                                AppText(
                                  '4.8',
                                  style: AppTextStyles.labelSmall(context)
                                      .copyWith(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    _FoodCardCopy(
                      name: name,
                      subtitle: subtitle,
                      price: price,
                      available: available,
                      availabilityLabel: availabilityLabel,
                      compact: false,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _FoodCardCopy extends StatelessWidget {
  const _FoodCardCopy({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.available,
    required this.availabilityLabel,
    required this.compact,
  });

  final String name, subtitle, price, availabilityLabel;
  final bool available, compact;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          name,
          style: AppTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 15.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        4.verticalSpace,
        AppText(
          subtitle,
          style: AppTextStyles.bodySmall(
            context,
          ).copyWith(
            color: dark
                ? Colors.white.withValues(alpha: 0.65)
                : const Color(0xFF666666),
            fontSize: 11.sp,
          ),
          maxLines: compact ? 1 : 2,
          overflow: TextOverflow.ellipsis,
        ),
        10.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 6.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Price Pill
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h).r,
              decoration: BoxDecoration(
                color: dark ? const Color(0xFF141416) : Colors.white,
                borderRadius: BorderRadius.circular(14).r,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
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
                  fontSize: 12.sp,
                ),
              ),
            ),
            // Circular Quick Add Pill Button
            if (available)
              Container(
                width: 28.r,
                height: 28.r,
                decoration: BoxDecoration(
                  color: const Color(0xFF141416),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 6.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 16.r,
                  ),
                ),
              )
            else
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h).r,
                decoration: BoxDecoration(
                  color: context.appColors.error.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: AppText(
                  availabilityLabel,
                  style: AppTextStyles.labelSmall(
                    context,
                  ).copyWith(color: context.appColors.error),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
