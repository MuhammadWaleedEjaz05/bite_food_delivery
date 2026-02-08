import 'package:bite_food_delivery/Widgets/bite_restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BiteSearchBar extends StatelessWidget {
  final bool isEnabled;
  const BiteSearchBar({super.key, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      autoFocus: false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onTap: () => isEnabled
          ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OpenSearchScreen()),
            )
          : null,
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

class OpenSearchScreen extends StatelessWidget {
  const OpenSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          50.verticalSpace,
          const BiteSearchBar(isEnabled: false),
          10.verticalSpace,
          ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: BiteRestaurantCard(),
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
