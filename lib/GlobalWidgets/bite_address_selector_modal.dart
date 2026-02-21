import 'package:bite_food_delivery/GlobalWidgets/bite_address_selection_card.dart';
import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddressError) {
          return Center(child: Text('Error: ${state.message}'));
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
                      'Select Delivery Address',
                      style: GoogleFonts.sen(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    20.verticalSpace,
                    Expanded(
                      child: state.addresses.isEmpty
                          ? Center(
                              child: Text(
                                'No addresses found',
                                style: GoogleFonts.sen(fontSize: 16.sp),
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
