import 'dart:ui';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/price_format.dart';
import 'package:bite_food_delivery/features/food_items/bloc/food_details_cubit.dart';
import 'package:bite_food_delivery/widgets/app_stepper_pill.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';

class FoodPurchaseSection extends StatelessWidget {
  const FoodPurchaseSection({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
    builder: (context, state) {
      final cubit = context.read<FoodDetailsCubit>();
      final strings = AppLocalizations.of(context)!;
      final message = switch (state.result) {
        FoodActionResult.added => strings.itemAddedToCart,
        FoodActionResult.failed => strings.cartAddFailed,
        FoodActionResult.signInRequired => strings.signInToOrder,
        FoodActionResult.unavailable => strings.itemUnavailable,
        FoodActionResult.idle => null,
      };
      return Container(
        decoration: BoxDecoration(
          color: context.appColors.surface.withValues(alpha: 0.94),
          border: Border(
            top: BorderSide(
              color: context.appColors.outlineVariant.withValues(alpha: 0.3),
              width: 1.r,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16.r,
              offset: Offset(0, -4.h),
            ),
          ],
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: context.contentInsets(top: 10, bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (message != null)
                      AppFeedback(
                        message: message,
                        actionLabel:
                            state.result == FoodActionResult.signInRequired
                            ? strings.login
                            : state.result == FoodActionResult.added
                            ? strings.viewCartAction
                            : null,
                        onAction:
                            state.result == FoodActionResult.signInRequired
                            ? () => AppNavigation.push(context, '/login_screen')
                            : state.result == FoodActionResult.added
                            ? () => AppNavigation.push(context, '/cart_screen')
                            : null,
                      ),
                    Row(
                      children: [
                        AppStepperPill(
                          quantity: state.quantity,
                          onDecrease: state.submitting || state.quantity <= 1
                              ? null
                              : () => cubit.setQuantity(state.quantity - 1),
                          onIncrease: state.submitting || state.quantity >= 99
                              ? null
                              : () => cubit.setQuantity(state.quantity + 1),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: AppPrimaryButton(
                            label: !cubit.available
                                ? strings.itemUnavailable
                                : state.submitting
                                ? strings.savingItem
                                : '${strings.addToCart} · ${context.priceLabel(cubit.total)}',
                            busy: state.submitting,
                            onTap: cubit.available ? cubit.addToCart : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
