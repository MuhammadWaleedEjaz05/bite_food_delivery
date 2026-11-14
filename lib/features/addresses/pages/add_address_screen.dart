import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/map_location_cubit.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_editor_header_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_form_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_label_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_map_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_save_section.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MapLocationCubit()),
        BlocProvider(create: (_) => AddressEditorCubit()),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            key: PageStorageKey('add_address'),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              AddressEditorHeaderSection(isUpdate: false),
              AddressMapSection(),
              AddressFormSection(isUpdate: false),
              AddressLabelSection(),
            ],
          ),
        ),
        bottomNavigationBar: AddressSaveSection(isUpdate: false),
      ),
    );
  }
}
