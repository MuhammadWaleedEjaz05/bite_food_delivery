import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_address_selection_card.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAddressSelectorModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.appColors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    builder: (context) => BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return Padding(
            padding: const EdgeInsets.all(32).r,
            child: const Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is AddressError) {
          final isUnauth =
              state.message.toLowerCase().contains('authenticated') ||
              state.message.toLowerCase().contains('sign in');
          if (isUnauth) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 24).r,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: context.appColors.outlineVariant.withValues(
                          alpha: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(2).r,
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      width: 64.r,
                      height: 64.r,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            context.appColors.primary.withValues(alpha: 0.16),
                            context.appColors.primary.withValues(alpha: 0.04),
                          ],
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.appColors.primary.withValues(
                            alpha: 0.25,
                          ),
                          width: 1.5.r,
                        ),
                      ),
                      child: Icon(
                        Icons.location_on_rounded,
                        size: 32.r,
                        color: context.appColors.primary,
                      ),
                    ),
                    16.verticalSpace,
                    AppText(
                      AppLocalizations.of(context)!.selectDeliveryAddress,
                      style: AppTextStyles.titleMedium(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    8.verticalSpace,
                    AppText(
                      AppLocalizations.of(context)!.pleaseSignInToContinue,
                      style: AppTextStyles.bodyMedium(
                        context,
                      ).copyWith(color: context.appColors.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                    24.verticalSpace,
                    AppPrimaryButton(
                      label: AppLocalizations.of(context)!.login,
                      onTap: () {
                        Navigator.pop(context);
                        AppNavigation.push(context, '/login_screen');
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(24).r,
            child: AppFeedback(
              message: AppLocalizations.of(
                context,
              )!.errorStatemessage(state.message),
              actionLabel: AppLocalizations.of(context)!.retryAction,
              onAction: () => context.read<AddressCubit>().loadAddresses(),
            ),
          );
        } else if (state is AddressesLoaded) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.55,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Padding(
                padding: const EdgeInsets.all(20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40.r,
                        height: 4.r,
                        decoration: BoxDecoration(
                          color: context.appColors.outlineVariant,
                          borderRadius: BorderRadius.circular(2).r,
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    AppText(
                      AppLocalizations.of(context)!.selectDeliveryAddress,
                      style: AppTextStyles.titleLarge(context),
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: state.addresses.isEmpty
                          ? Center(
                              child: AppFeedback(
                                message: AppLocalizations.of(
                                  context,
                                )!.noAddressesFound,
                                icon: Icons.location_off_outlined,
                              ),
                            )
                          : ListView.separated(
                              controller: scrollController,
                              itemBuilder: (context, index) {
                                final address = state.addresses[index];
                                final isSelected =
                                    state.selectedAddress?.addressID ==
                                    address.addressID;
                                return BiteAddressSelectionCard(
                                  address: address,
                                  isSelected: isSelected,
                                  onSelect: () {
                                    context.read<AddressCubit>().selectAddress(
                                      address,
                                    );
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              separatorBuilder: (_, _) => 12.verticalSpace,
                              itemCount: state.addresses.length,
                            ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    ),
  );
}
