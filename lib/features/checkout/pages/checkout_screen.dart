import 'package:flutter/material.dart';
import '../sections/checkout_header_section.dart';
import '../sections/checkout_card_section.dart';
import '../sections/checkout_address_section.dart';
import '../sections/checkout_status_section.dart';
import '../sections/checkout_totals_section.dart';
import '../sections/checkout_action_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          CheckoutHeaderSection(),
          CheckoutAddressSection(),
          CheckoutStatusSection(),
          CheckoutTotalsSection(),
          CheckoutCardSection(),
        ],
      ),
    ),
    bottomNavigationBar: CheckoutActionSection(),
  );
}
