import 'package:bite_food_delivery/features/reviews/bloc/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/features/reviews/sections/my_reviews_header_section.dart';
import 'package:bite_food_delivery/features/reviews/sections/my_reviews_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyReviewsScreen extends StatelessWidget {
  final RatingAndReviewCubit? reviewsCubit;

  const MyReviewsScreen({super.key, this.reviewsCubit});

  @override
  Widget build(BuildContext context) {
    const pageBody = Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('my_reviews_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [MyReviewsHeaderSection(), MyReviewsListSection()],
        ),
      ),
    );

    if (reviewsCubit != null) {
      return BlocProvider<RatingAndReviewCubit>.value(
        value: reviewsCubit!,
        child: pageBody,
      );
    }

    return BlocProvider<RatingAndReviewCubit>(
      create: (_) => RatingAndReviewCubit()..init(),
      child: pageBody,
    );
  }
}
