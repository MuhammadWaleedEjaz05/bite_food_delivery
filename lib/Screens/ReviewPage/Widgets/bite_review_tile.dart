import 'package:bite_food_delivery/Models/rating_and_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteReviewTile extends StatelessWidget {
  final RatingAndReviewModel review;

  const BiteReviewTile({super.key,required this.review});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Icon(Icons.rate_review, color: colorScheme.primary),
        ),
        title: Text(
          'Order: ${review.orderId}',
          style: GoogleFonts.sen(
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            6.verticalSpace,
            Row(
              children: [
                _buildRatingStars(review.orderRating, colorScheme),
                8.horizontalSpace,
                Text(
                  review.orderRating.toStringAsFixed(1),
                  style: GoogleFonts.sen(
                    fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            6.verticalSpace,
            Text(
              review.reviewText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.sen(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating, ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return const Icon(Icons.star, size: 16, color: Colors.amber);
        } else if (index < rating) {
          return const Icon(Icons.star_half, size: 16, color: Colors.amber);
        }
        return Icon(
          Icons.star_border,
          size: 16,
          color: colorScheme.onSurfaceVariant,
        );
      }),
    );
  }
}
