import 'package:bite_food_delivery/src/shared/widgets/bite_address_selection_card.dart';
import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

void showAddressSelectorModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.r),
        topRight: Radius.circular(25.r),
      ),
    ),
    builder: (context) => BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 75.h,
              width: 75.w,
            ),
          );
        } else if (state is AddressError) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.errorStatemessage(state.message),
            ),
          );
        } else if (state is AddressesLoaded) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.selectDeliveryAddress,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    20.verticalSpace,
                    Expanded(
                      child: state.addresses.isEmpty
                          ? Center(
                              child: Text(
                                AppLocalizations.of(context)!.noAddressesFound,
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(fontWeight: FontWeight.normal),
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
                              separatorBuilder: (context, index) =>
                                  10.verticalSpace,
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
