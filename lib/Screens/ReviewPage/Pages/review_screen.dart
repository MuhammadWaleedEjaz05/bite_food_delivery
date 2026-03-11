import 'package:bite_food_delivery/Cubits/RatingAndReviewCubit/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/Cubits/RatingAndReviewCubit/rating_change_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/Models/order_model.dart';
import 'package:bite_food_delivery/Models/rating_and_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewTextController = TextEditingController();
    final order = ModalRoute.of(context)!.settings.arguments as OrderModel;
    return MultiBlocProvider(
      providers: [
        BlocProvider<RatingChangeCubit>(
          create: (context) => RatingChangeCubit(),
        ),
        BlocProvider<RatingAndReviewCubit>(
          create: (context) => RatingAndReviewCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _AppBarSection(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: BlocBuilder<RatingChangeCubit, Map<String, double>>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  30.verticalSpace,
                  _RatingSection(state),
                  20.verticalSpace,
                  _UserReviewSection(reviewTextController),
                  const Spacer(),
                  _SubmitSection(order, state, reviewTextController),
                  20.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RatingSection extends StatelessWidget {
  final Map<String, double> state;
  const _RatingSection(this.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BiteHeading(title: 'Order Ratings', isSeeAll: false),
        20.verticalSpace,
        StarRating(
          rating: state['orderRating'] ?? 0.0,
          color: Theme.of(context).colorScheme.primary,
          borderColor: Theme.of(context).colorScheme.primary,
          size: 30.r,
          onRatingChanged: (rating) {
            context.read<RatingChangeCubit>().changeRating(
              'orderRating',
              rating,
            );
          },
        ),
        20.verticalSpace,
        const BiteHeading(title: 'Restaurant Ratings', isSeeAll: false),
        20.verticalSpace,
        StarRating(
          rating: state['restaurantRating'] ?? 0.0,
          color: Theme.of(context).colorScheme.primary,
          borderColor: Theme.of(context).colorScheme.primary,
          size: 30.r,
          onRatingChanged: (rating) {
            context.read<RatingChangeCubit>().changeRating(
              'restaurantRating',
              rating,
            );
          },
        ),
      ],
    );
  }
}

class _UserReviewSection extends StatelessWidget {
  final TextEditingController reviewTextController;
  const _UserReviewSection(this.reviewTextController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BiteHeading(title: 'User Reviews', isSeeAll: false),
        20.verticalSpace,
        TextFormField(
          controller: reviewTextController,
          maxLines: 5,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSecondaryFixed,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitSection extends StatelessWidget {
  final OrderModel order;
  final Map<String, double> state;
  final TextEditingController reviewTextController;
  const _SubmitSection(this.order, this.state, this.reviewTextController);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final orderRating = state['orderRating'] ?? 0.0;
        final restaurantRating = state['restaurantRating'] ?? 0.0;
        final orderId = order.orderId;
        final userId = order.userId;
        final restaurantId = order.restaurantId;
        final reviewText = reviewTextController.text;
        final review = RatingAndReviewModel(
          userId: userId,
          orderId: orderId,
          restaurantId: restaurantId,
          orderRating: orderRating,
          restaurantRating: restaurantRating,
          reviewText: reviewText,
        );
        context.read<RatingAndReviewCubit>().submitReviews(
          review,
          context.read<RestaurantsCubit>(),
        );
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10.r),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.headlineLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide.none,
        ),
      ),
      child: const Text('Submit'),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Review',
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [],
    );
  }
}
