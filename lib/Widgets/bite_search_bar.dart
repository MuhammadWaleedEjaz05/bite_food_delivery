import 'package:bite_food_delivery/Widgets/bite_restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteSearchBar extends StatelessWidget {
  const BiteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      autoFocus: true,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onTap: () => showSearch(context: context, delegate: OpenSearchScreen()),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      ),
      hintText: 'Search for restaurants or dishes',
      hintStyle: WidgetStatePropertyAll(
        GoogleFonts.sen(fontSize: 16.sp, color: Colors.grey.shade600),
      ),
      leading: Icon(Icons.search, size: 25.r, color: Colors.grey.shade600),
      elevation: WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}

class OpenSearchScreen extends SearchDelegate {
  @override
  Widget buildLeading(BuildContext context) {
    return Row(
      children: [
        8.horizontalSpace,
        IconButton(
          onPressed: () => close(context, Null),

          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.withAlpha(50),
          ),
          icon: Icon(Icons.arrow_back, size: 30.r),
        ),
      ],
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        icon: Icon(Icons.clear_outlined, size: 30.r),
      ),
      15.horizontalSpace,
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: BiteRestaurantCard(),
        );
      },
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: BiteRestaurantCard(),
        );
      },
      itemCount: 1,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
