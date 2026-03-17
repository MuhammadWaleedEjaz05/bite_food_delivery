import 'package:bite_food_delivery/Cubits/RatingAndReviewCubit/rating_and_review_cubit.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Screens/ReviewPage/Widgets/bite_review_tile.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingAndReviewCubit()..init(),
      child: Scaffold(
        appBar: BiteAppBar(
          backButton: true,
          title: Text(
            S.of(context).myReviews,
            style: GoogleFonts.sen(
              fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
              fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: const [],
        ),
        body: BlocBuilder<RatingAndReviewCubit, RatingAndReviewState>(
          builder: (context, state) {
            if (state is RatingAndReviewLoading) {
              return Center(
                child: Lottie.asset(
                  'assets/animations/loading.json',
                  height: 75.h,
                  width: 75.w,
                ),
              );
            }
            if (state is RatingAndReviewError) {
              return Center(
                child: Text(
                  state.message,
                  style: GoogleFonts.sen(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              );
            }
            if (state is RatingAndReviewLoaded) {
              final reviews = state.reviews;
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                itemCount: reviews.length,
                separatorBuilder: (context, index) => 10.verticalSpace,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return BiteReviewTile(review: review);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
