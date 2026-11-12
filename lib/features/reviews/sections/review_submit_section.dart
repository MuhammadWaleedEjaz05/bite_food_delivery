import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/orders/models/order_model.dart';
import 'package:bite_food_delivery/features/restaurants/bloc/restaurants_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_cubit.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_state.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewSubmitSection extends StatelessWidget {
  final OrderModel order;

  const ReviewSubmitSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final editorCubit = context.read<ReviewEditorCubit>();
    final reviewsCubit = context.read<RatingAndReviewCubit>();
    final restaurantsCubit = context.read<RestaurantsCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 32),
      sliver: SliverToBoxAdapter(
        child: BlocConsumer<ReviewEditorCubit, ReviewEditorState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(t.reviewSubmitted)));
              Navigator.of(context).pop();
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
          builder: (context, state) {
            return AppPrimaryButton(
              label: t.submitReview,
              busy: state.isSubmitting,
              onTap: state.isSubmitting
                  ? null
                  : () => editorCubit.submit(
                      order: order,
                      reviewsCubit: reviewsCubit,
                      restaurantsCubit: restaurantsCubit,
                    ),
            );
          },
        ),
      ),
    );
  }
}
