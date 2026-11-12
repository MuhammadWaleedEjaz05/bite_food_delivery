import 'package:flutter/material.dart';
import '../sections/cart_header_section.dart';
import '../sections/cart_feedback_section.dart';
import '../sections/cart_items_section.dart';
import '../sections/cart_summary_section.dart';
import '../sections/cart_checkout_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          CartHeaderSection(),
          CartFeedbackSection(),
          CartItemsSection(),
          CartSummarySection(),
        ],
      ),
    ),
    bottomNavigationBar: CartCheckoutSection(),
  );
}
