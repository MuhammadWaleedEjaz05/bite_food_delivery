import 'package:bite_food_delivery/Screens/AddressPage/Widgets/bite_address_block.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_section.dart';
import 'package:bite_food_delivery/Cubits/AddressCubit/address_cubit.dart';
import 'package:bite_food_delivery/Models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().loadAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            _AddressSection(),
            Spacer(),
            _AddAddressSection(),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _AddAddressSection extends StatelessWidget {
  const _AddAddressSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/add_address_screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: GoogleFonts.sen(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: Text('Add Address'),
          ),
        ),
      ],
    );
  }
}

class _AddressSection extends StatelessWidget {
  const _AddressSection();

  String _formatAddress(AddressModel address) {
    final parts = [
      address.street,
      address.city,
      address.zipCode,
      address.country,
    ].where((part) => part.trim().isNotEmpty).toList();

    if (parts.isEmpty) {
      return 'Address not available';
    }

    return parts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is AddressError) {
          return Text(
            'Failed to load addresses',
            style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black54),
          );
        }

        if (state is AddressesLoaded) {
          final addresses = state.addresses;
          if (addresses.isEmpty) {
            return Text(
              'No saved addresses yet',
              style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black54),
            );
          }

          final items = addresses
              .map(
                (address) => BiteAddressBlock(
                  onDelete: () => context.read<AddressCubit>().deleteAddress(
                    address.addressID,
                  ),
                  label: address.label,
                  addressText: _formatAddress(address),
                ),
              )
              .toList();

          return BiteMenuSection(menuItems: items);
        }

        return Text(
          'Please sign in to view addresses',
          style: GoogleFonts.sen(fontSize: 16.sp, color: Colors.black54),
        );
      },
    );
  }
}

class _AppSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        'Address',
        style: GoogleFonts.sen(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [],
    );
  }
}
