import 'package:bite_food_delivery/GlobalWidgets/bite_app_bar.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_heading.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_item.dart';
import 'package:bite_food_delivery/GlobalWidgets/bite_menu_section.dart';
import 'package:bite_food_delivery/Screens/FAQPage/Widgets/bite_support_blocks.dart';
import 'package:bite_food_delivery/configs/frequently_asked_questions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _AppBarSection(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          20.verticalSpace,
          _SupportTeamContactSection(),
          20.verticalSpace,
          _OrderFAQsSection(),
          _PaymentFAQsSection(),
          _DeliveryFAQsSection(),
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
        'FAQs',
        style: GoogleFonts.sen(
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [],
    );
  }
}

class _DeliveryFAQsSection extends StatelessWidget {
  const _DeliveryFAQsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BiteHeading(title: 'Delivery', isSeeAll: false),
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
        BiteHeading(title: 'Payments', isSeeAll: false),
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
        BiteHeading(title: 'Order', isSeeAll: false),
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
          title: 'Chat',
          icon: Icons.chat_outlined,
          color: Colors.deepOrange,
        ),
        BiteSupportBlocks(
          title: 'Call',
          icon: Icons.call_outlined,
          color: Colors.blue,
        ),
        BiteSupportBlocks(
          title: 'Email',
          icon: Icons.email_outlined,
          color: Colors.green,
        ),
      ],
    );
  }
}
