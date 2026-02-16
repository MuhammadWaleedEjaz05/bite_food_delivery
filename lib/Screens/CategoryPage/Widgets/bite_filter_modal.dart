import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/Cubits/FilterRestaurantsCubit/filter_restaurants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteFilterModal extends StatelessWidget {
  const BiteFilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterRestaurantsCubit, FilterRestaurantsState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _HeadingSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DeliveryTimeSection(
                    selectedRange: state.deliveryTimeRange,
                    onSelected: (range) {
                      context
                          .read<FilterRestaurantsCubit>()
                          .setDeliveryTimeRange(range);
                    },
                  ),
                  15.verticalSpace,
                  _RatingSection(
                    selectedRange: state.ratingRange,
                    onSelected: (range) {
                      context.read<FilterRestaurantsCubit>().setRatingRange(
                        range,
                      );
                    },
                  ),
                  15.verticalSpace,
                  _ApplySection(
                    onApply: () {
                      Navigator.pop(context);
                    },
                    onClear: () {
                      context.read<FilterRestaurantsCubit>().clearFilters();
                    },
                  ),
                  15.verticalSpace,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ApplySection extends StatelessWidget {
  final VoidCallback onApply;
  final VoidCallback onClear;
  const _ApplySection({required this.onApply, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              side: BorderSide(color: Theme.of(context).primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: onClear,
            child: Text(
              'CLEAR',
              style: GoogleFonts.sen(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: onApply,
            child: Text(
              'APPLY',
              style: GoogleFonts.sen(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RatingSection extends StatelessWidget {
  final RatingFilterRange? selectedRange;
  final ValueChanged<RatingFilterRange?> onSelected;
  const _RatingSection({required this.selectedRange, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiteHeading(title: 'RATING', isSeeAll: false),
        15.verticalSpace,
        SizedBox(
          height: 40.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              _BiteFilterTextButton(
                title: '< 3.5',
                isSelected: selectedRange == RatingFilterRange.below35,
                onTap: () {
                  onSelected(
                    selectedRange == RatingFilterRange.below35
                        ? null
                        : RatingFilterRange.below35,
                  );
                },
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '3.5 - 4.0',
                isSelected: selectedRange == RatingFilterRange.between35And40,
                onTap: () {
                  onSelected(
                    selectedRange == RatingFilterRange.between35And40
                        ? null
                        : RatingFilterRange.between35And40,
                  );
                },
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '> 4.0',
                isSelected: selectedRange == RatingFilterRange.above40,
                onTap: () {
                  onSelected(
                    selectedRange == RatingFilterRange.above40
                        ? null
                        : RatingFilterRange.above40,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DeliveryTimeSection extends StatelessWidget {
  final DeliveryTimeFilterRange? selectedRange;
  final ValueChanged<DeliveryTimeFilterRange?> onSelected;
  const _DeliveryTimeSection({
    required this.selectedRange,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiteHeading(title: 'DELIVERY TIME', isSeeAll: false),
        15.verticalSpace,
        SizedBox(
          height: 40.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              _BiteFilterTextButton(
                title: '< 15 min',
                isSelected: selectedRange == DeliveryTimeFilterRange.under15,
                onTap: () {
                  onSelected(
                    selectedRange == DeliveryTimeFilterRange.under15
                        ? null
                        : DeliveryTimeFilterRange.under15,
                  );
                },
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '15 - 30 min',
                isSelected:
                    selectedRange == DeliveryTimeFilterRange.between15And30,
                onTap: () {
                  onSelected(
                    selectedRange == DeliveryTimeFilterRange.between15And30
                        ? null
                        : DeliveryTimeFilterRange.between15And30,
                  );
                },
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '> 30 min',
                isSelected: selectedRange == DeliveryTimeFilterRange.over30,
                onTap: () {
                  onSelected(
                    selectedRange == DeliveryTimeFilterRange.over30
                        ? null
                        : DeliveryTimeFilterRange.over30,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      title: Text(
        'Filter your search',
        style: GoogleFonts.sen(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.shade200,
          ),
          icon: Icon(Icons.close, size: 30.r),
        ),
        15.horizontalSpace,
      ],
    );
  }
}

class _BiteFilterTextButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  const _BiteFilterTextButton({
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isSelected
            ? Colors.white
            : Theme.of(context).primaryColor,
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: Text(title, style: GoogleFonts.sen(fontSize: 16.sp)),
    );
  }
}
