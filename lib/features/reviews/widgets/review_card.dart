import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/reviews/models/rating_and_review_model.dart';
import 'package:bite_food_delivery/features/reviews/widgets/star_rating_bar.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  final RatingAndReviewModel review;
  final String? restaurantName;

  const ReviewCard({super.key, required this.review, this.restaurantName});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final shortOrderId = review.orderId.length > 8
        ? review.orderId.substring(0, 8)
        : review.orderId;

    final dateStr = review.createdAt != null
        ? DateFormat('dd MMM yyyy, hh:mm a').format(review.createdAt!)
        : null;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20).r,
      child: Container(
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          border: Border.all(color: colors.outlineVariant, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8).r,
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.rate_review_outlined,
                    size: 20.r,
                    color: colors.primary,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        restaurantName ?? '${t.orderDetails} #$shortOrderId',
                        style: AppTextStyles.titleMedium(context),
                        maxLines: 2,
                      ),
                      if (dateStr != null) ...[
                        2.verticalSpace,
                        AppText(
                          dateStr,
                          style: AppTextStyles.bodyMedium(
                            context,
                          ).copyWith(color: colors.onSurfaceVariant),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Divider(color: colors.outlineVariant, height: 1),
            12.verticalSpace,
            Wrap(
              spacing: 16.r,
              runSpacing: 8.r,
              children: [
                Wrap(
                  spacing: 4.r,
                  runSpacing: 2.r,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    AppText(
                      '${t.orderRating}: ',
                      style: AppTextStyles.labelSmall(
                        context,
                      ).copyWith(color: colors.onSurfaceVariant),
                    ),
                    StarRatingBar(
                      rating: review.orderRating,
                      size: 16.r,
                      spacing: 2,
                    ),
                    4.horizontalSpace,
                    AppText(
                      review.orderRating.toStringAsFixed(1),
                      style: AppTextStyles.labelMedium(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 4.r,
                  runSpacing: 2.r,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    AppText(
                      '${t.restaurantRating}: ',
                      style: AppTextStyles.labelSmall(
                        context,
                      ).copyWith(color: colors.onSurfaceVariant),
                    ),
                    StarRatingBar(
                      rating: review.restaurantRating,
                      size: 16.r,
                      spacing: 2,
                    ),
                    4.horizontalSpace,
                    AppText(
                      review.restaurantRating.toStringAsFixed(1),
                      style: AppTextStyles.labelMedium(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            if (review.reviewText.isNotEmpty) ...[
              12.verticalSpace,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12).r,
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12).r,
                ),
                child: AppText(
                  review.reviewText,
                  style: AppTextStyles.bodyMedium(context),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
