import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteFilterModal extends StatelessWidget {
  const BiteFilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _HeadingSection(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OfferSection(),
              15.verticalSpace,
              _DeliveryTimeSection(),
              15.verticalSpace,
              _PricingSection(),
              15.verticalSpace,
              _RatingSection(),
              15.verticalSpace,
              _ApplySection(),
              15.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}

class _ApplySection extends StatelessWidget {
  const _ApplySection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {},
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
  const _RatingSection();

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
                title: '1 star',
                isSelected: false,
                onTap: () {},
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '2 star',
                isSelected: false,
                onTap: () {},
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '3 star',
                isSelected: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PricingSection extends StatelessWidget {
  const _PricingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiteHeading(title: 'PRICING', isSeeAll: false),
        15.verticalSpace,
        SizedBox(
          height: 40.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              _BiteFilterTextButton(title: "\$", isSelected: false),
              10.horizontalSpace,
              _BiteFilterTextButton(title: "\$\$", isSelected: false),
              10.horizontalSpace,
              _BiteFilterTextButton(title: "\$\$\$", isSelected: false),
            ],
          ),
        ),
      ],
    );
  }
}

class _DeliveryTimeSection extends StatelessWidget {
  const _DeliveryTimeSection();

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
                title: '10-15 min',
                isSelected: false,
                onTap: () {},
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '20 min',
                isSelected: false,
                onTap: () {},
              ),
              10.horizontalSpace,
              _BiteFilterTextButton(
                title: '30 min',
                isSelected: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OfferSection extends StatelessWidget {
  const _OfferSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiteHeading(title: 'OFFERS', isSeeAll: false),
        15.verticalSpace,
        GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            mainAxisExtent: 40.h,
          ),
          children: [
            _BiteFilterTextButton(
              title: 'Delivery',
              isSelected: false,
              onTap: () {},
            ),
            _BiteFilterTextButton(
              title: 'Pickup',
              isSelected: false,
              onTap: () {},
            ),
            _BiteFilterTextButton(
              title: 'Offer',
              isSelected: false,
              onTap: () {},
            ),
            _BiteFilterTextButton(
              title: 'Online Payment Available',
              isSelected: false,
              onTap: () {},
            ),
          ],
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
