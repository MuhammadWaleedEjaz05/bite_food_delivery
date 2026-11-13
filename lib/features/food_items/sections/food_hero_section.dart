import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/widgets/app_network_image.dart';

class FoodHeroSection extends StatelessWidget {
  const FoodHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodDetailsCubit>();
    final item = cubit.arguments.item;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return SliverPadding(
      padding: context.contentInsets(bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 240.h,
          decoration: BoxDecoration(
            color: dark ? const Color(0xFF1E2820) : const Color(0xFFDCEFD9),
            borderRadius: BorderRadius.circular(28).r,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: dark ? 0.3 : 0.06),
                blurRadius: 18.r,
                offset: Offset(0, 6.h),
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(16.r),
          child: AppNetworkImage(
            url: item.images.firstOrNull ?? "",
            height: 200.r,
            width: 260.w,
            radius: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
