import 'package:bite_food_delivery/Widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/Widgets/bite_cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditActive = false;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 30, 46),
      appBar: _AppBarSection(isEditActive: isEditActive),
      body: Column(
        children: [
          _CartSection(isEditActive: isEditActive),
          _CheckOutSection(),
        ],
      ),
    );
  }
}

class _CheckOutSection extends StatelessWidget {
  const _CheckOutSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.5.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'DELIVERY ADDRESS',
                      style: GoogleFonts.sen(
                        fontSize: 15.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'EDIT',
                        style: GoogleFonts.sen(
                          fontSize: 15.sp,
                          color: Colors.deepOrange,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.deepOrange,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text('TOTAL : ', style: GoogleFonts.sen(fontSize: 15.sp)),
                    Text(
                      'PKR 400',
                      style: GoogleFonts.sen(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'CHECKOUT',
                          style: GoogleFonts.sen(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CartSection extends StatelessWidget {
  final bool isEditActive;
  const _CartSection({this.isEditActive = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withAlpha(0)),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          itemBuilder: (context, index) =>
              BiteCartItemCard(isEditActive: isEditActive),
          separatorBuilder: (context, index) => 10.verticalSpace,
          itemCount: 5,
        ),
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  final bool isEditActive;
  const _AppBarSection({this.isEditActive = false});
  @override
  Size get preferredSize => Size.fromHeight(100.h);
  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      isDarkMode: true,
      backButton: true,
      title: Text(
        'Cart',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            isEditActive ? 'DONE' : 'EDIT ITEMS',
            style: GoogleFonts.sen(
              fontSize: 20.sp,
              color: isEditActive ? Colors.green : Colors.deepOrange,
              decoration: TextDecoration.underline,
              decorationColor: isEditActive ? Colors.green : Colors.deepOrange,
              decorationThickness: 2,
            ),
          ),
        ),
        15.horizontalSpace,
      ],
    );
  }
}
