import 'package:bite_food_delivery/Cubits/RecentSearchesCubit/recent_searches_cubit.dart';
import 'package:bite_food_delivery/Cubits/RestaurantsCubit/restaurants_cubit.dart';
import 'package:bite_food_delivery/Configs/skeleton_widgets.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/Screens/SearchPage/Widgets/bite_recent_search_button.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_restaurant_card.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_search_bar.dart';
import 'package:bite_food_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          10.verticalSpace,
          const BiteSearchBar(),
          20.verticalSpace,
          const _RecentSearchSection(),
          20.verticalSpace,
          const _PopularRestaurantSection(),
        ],
      ),
    );
  }
}

class _PopularRestaurantSection extends StatelessWidget {
  const _PopularRestaurantSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(title: S.of(context).popularRestaurants, isSeeAll: false),
        10.verticalSpace,
        BlocBuilder<RestaurantsCubit, RestaurantsState>(
          builder: (context, state) {
            if (state is RestaurantsLoading) {
              return const SkeletonizedRestaurantList(itemCount: 3);
            } else if (state is RestaurantsError) {
              return Center(
                child: Text(S.of(context).errorStatemessage(state.message)),
              );
            } else if (state is RestaurantsLoaded) {
              final popular = state.restaurants
                  .where((restaurant) => restaurant.rating >= 4.5)
                  .toList();
              if (popular.isEmpty) {
                return Center(
                  child: Text(
                    S.of(context).noPopularRestaurantsFound,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: popular.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: BiteRestaurantCard(restaurant: popular[index]),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

class _RecentSearchSection extends StatelessWidget {
  const _RecentSearchSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(title: S.of(context).recentKeywords, isSeeAll: false),
        10.verticalSpace,
        SizedBox(
          height: 40.h,
          child: BlocConsumer<RecentSearchesCubit, RecentSearchesState>(
            listener: (context, state) {
              if (state is RecentSearchedAdded) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    message: S
                        .of(context)
                        .addedStatesearchToRecentSearches(state.search),
                  ),
                );
              } else if (state is RecentSearchedRemoved) {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.info(
                    message: S
                        .of(context)
                        .removedStatesearchFromRecentSearches(state.search),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is RecentSearchesLoaded) {
                if (state.recentSearches.isEmpty) {
                  return Center(
                    child: Text(
                      S.of(context).noRecentSearches,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: state.recentSearches.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BiteRecentSearchButton(
                    search: state.recentSearches[index],
                  ),
                  separatorBuilder: (context, index) => 5.horizontalSpace,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      title: Text(
        S.of(context).search,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          icon: Icon(Icons.shopping_bag_outlined, size: 35.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
