import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/map_location_cubit.dart';
import 'package:bite_food_delivery/features/addresses/models/address_model.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_editor_header_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_form_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_label_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_map_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_save_section.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAddressScreen extends StatelessWidget {
  final AddressModel? address;

  const UpdateAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    final effectiveAddress =
        address ??
        (ModalRoute.of(context)?.settings.arguments as AddressModel?);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MapLocationCubit()),
        BlocProvider(
          create: (_) => AddressEditorCubit(initialAddress: effectiveAddress),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            key: const PageStorageKey('update_address'),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              const AddressEditorHeaderSection(isUpdate: true),
              AddressMapSection(initialLocation: effectiveAddress?.location),
              AddressFormSection(
                isUpdate: true,
                initialAddress: effectiveAddress,
              ),
              AddressLabelSection(initialLabel: effectiveAddress?.label),
            ],
          ),
        ),
        bottomNavigationBar: AddressSaveSection(
          isUpdate: true,
          addressId: effectiveAddress?.addressID,
        ),
      ),
    );
  }
}
