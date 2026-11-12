import 'package:bite_food_delivery/features/addresses/sections/address_action_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_header_section.dart';
import 'package:bite_food_delivery/features/addresses/sections/address_list_section.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('addresses'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [AddressHeaderSection(), AddressListSection()],
        ),
      ),
      bottomNavigationBar: AddressActionSection(),
    );
  }
}
