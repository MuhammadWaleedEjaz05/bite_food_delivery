import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_cubit.dart';
import 'package:bite_food_delivery/features/addresses/widgets/address_card.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressListSection extends StatelessWidget {
  const AddressListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: context.contentInsets(top: 12, bottom: 24),
      sliver: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressLoading) {
            return const SliverToBoxAdapter(child: AppLoadingCard());
          }
          if (state is AddressError) {
            return SliverToBoxAdapter(
              child: AppFeedback(
                message: state.message,
                actionLabel: t.retryAction,
                onAction: () => context.read<AddressCubit>().loadAddresses(),
              ),
            );
          }
          if (state is AddressesLoaded) {
            if (state.addresses.isEmpty) {
              return SliverToBoxAdapter(
                child: AppFeedback(
                  message: t.noAddressesFound,
                  icon: Icons.location_off_outlined,
                ),
              );
            }
            return SliverList.separated(
              itemCount: state.addresses.length,
              separatorBuilder: (_, _) => 14.verticalSpace,
              itemBuilder: (context, index) {
                final address = state.addresses[index];
                final isSelected =
                    state.selectedAddress?.addressID == address.addressID;
                return AddressCard(
                  address: address,
                  isSelected: isSelected,
                  onSelect: () =>
                      context.read<AddressCubit>().selectAddress(address),
                  onEdit: () => AppNavigation.push(
                    context,
                    '/update_address_screen',
                    arguments: address,
                  ),
                  onDelete: () => context.read<AddressCubit>().deleteAddress(
                    address.addressID,
                  ),
                );
              },
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
