import 'package:bite_food_delivery/src/features/address_management/widgets/bite_address_block.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_menu_section.dart';
import 'package:bite_food_delivery/src/features/address_management/cubits/address_cubit/address_cubit.dart';
import 'package:bite_food_delivery/src/features/address_management/models/address_model.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppSection(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            const _AddressSection(),
            const Spacer(),
            const _AddAddressSection(),
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
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              textStyle: Theme.of(context).textTheme.titleSmall,
            ),
            child: Text(AppLocalizations.of(context)!.addAddress),
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
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              height: 75.h,
              width: 75.w,
            ),
          );
        }

        if (state is AddressError) {
          return Text(
            AppLocalizations.of(context)!.failedToLoadAddresses,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          );
        }

        if (state is AddressesLoaded) {
          final addresses = state.addresses;
          if (addresses.isEmpty) {
            return Text(
              AppLocalizations.of(context)!.noSavedAddressesYet,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
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
                  onEdit: () => Navigator.pushNamed(
                    context,
                    '/update_address_screen',
                    arguments: address,
                  ),
                ),
              )
              .toList();

          return BiteMenuSection(menuItems: items);
        }

        return Text(
          AppLocalizations.of(context)!.pleaseSignInToViewAddresses,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
          ),
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
        AppLocalizations.of(context)!.address,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [],
    );
  }
}
