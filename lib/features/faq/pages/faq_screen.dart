import 'package:bite_food_delivery/features/faq/sections/faq_accordion_section.dart';
import 'package:bite_food_delivery/features/faq/sections/faq_contact_section.dart';
import 'package:bite_food_delivery/features/faq/sections/faq_header_section.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          key: PageStorageKey('faq_screen'),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            FaqHeaderSection(),
            FaqContactSection(),
            FaqAccordionSection(),
          ],
        ),
      ),
    );
  }
}
