import 'package:bite_food_delivery/src/shared/widgets/bite_app_bar.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_heading.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_menu_item.dart';
import 'package:bite_food_delivery/src/shared/widgets/bite_menu_section.dart';
import 'package:bite_food_delivery/src/features/faq_help_support/widgets/bite_support_blocks.dart';
import 'package:bite_food_delivery/src/features/faq_help_support/models/frequently_asked_questions_list.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          20.verticalSpace,
          const _SupportTeamContactSection(),
          20.verticalSpace,
          const _OrderFAQsSection(),
          const _PaymentFAQsSection(),
          const _DeliveryFAQsSection(),
        ],
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarSection();
  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return BiteAppBar(
      backButton: true,
      title: Text(
        AppLocalizations.of(context)!.faqs,
        style: GoogleFonts.sen(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.displaySmall!.fontWeight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [],
    );
  }
}

class _DeliveryFAQsSection extends StatelessWidget {
  const _DeliveryFAQsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: AppLocalizations.of(context)!.delivery,
          isSeeAll: false,
        ),
        10.verticalSpace,
        Column(
          spacing: 10.h,
          children: deliveryFAQs(context)
              .map<Widget>(
                (BiteMenuItemModel e) =>
                    BiteMenuSection(menuItems: [BiteMenuItem(item: e)]),
              )
              .toList(),
        ),
        20.verticalSpace,
      ],
    );
  }
}

class _PaymentFAQsSection extends StatelessWidget {
  const _PaymentFAQsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: AppLocalizations.of(context)!.payments,
          isSeeAll: false,
        ),
        10.verticalSpace,
        Column(
          spacing: 10.h,
          children: paymentsFAQs(context)
              .map<Widget>(
                (BiteMenuItemModel e) =>
                    BiteMenuSection(menuItems: [BiteMenuItem(item: e)]),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _OrderFAQsSection extends StatelessWidget {
  const _OrderFAQsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(
          title: AppLocalizations.of(context)!.order,
          isSeeAll: false,
        ),
        10.verticalSpace,
        Column(
          spacing: 10.h,
          children: orderFAQs(context)
              .map<Widget>(
                (BiteMenuItemModel e) =>
                    BiteMenuSection(menuItems: [BiteMenuItem(item: e)]),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _SupportTeamContactSection extends StatelessWidget {
  const _SupportTeamContactSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BiteSupportBlocks(
          title: AppLocalizations.of(context)!.chat,
          icon: Icons.chat_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        BiteSupportBlocks(
          title: AppLocalizations.of(context)!.call,
          icon: Icons.call_outlined,
          color: Colors.blue,
        ),
        BiteSupportBlocks(
          title: AppLocalizations.of(context)!.email,
          icon: Icons.email_outlined,
          color: Colors.green,
        ),
      ],
    );
  }
}
