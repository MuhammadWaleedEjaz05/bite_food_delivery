import 'package:flutter/material.dart';
import '../sections/payment_header_section.dart';
import '../sections/payment_info_section.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [PaymentHeaderSection(), PaymentInfoSection()],
      ),
    ),
  );
}
