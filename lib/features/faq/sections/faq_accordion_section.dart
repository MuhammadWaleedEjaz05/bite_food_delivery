import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/features/faq/widgets/faq_tile.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqAccordionSection extends StatelessWidget {
  const FaqAccordionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final orderFaqs = [
      {
        'q': t.howDoITrackMyOrder,
        'a':
            'You can track your order in real-time on the Track Order screen with live map updates.',
      },
      {
        'q': t.canICancelMyOrder,
        'a':
            'Orders can be cancelled before the restaurant begins cooking your meal.',
      },
      {
        'q': t.whatIfMyOrderIsDelayed,
        'a':
            'Contact our support hotline directly or chat with your courier rider for immediate assistance.',
      },
    ];

    final paymentFaqs = [
      {
        'q': t.whatPaymentMethodsAreAccepted,
        'a': 'We accept Cash on Delivery and Credit/Debit Cards via Stripe.',
      },
      {
        'q': t.isItSafeToUseMyCreditdebitCardOnBite,
        'a':
            'Yes, all card payments are securely tokenized through Stripe PCI DSS Level 1 certified gateways.',
      },
      {
        'q': t.whatShouldIDoIfAPaymentFails,
        'a':
            'If card verification fails, you can switch to Cash on Delivery or try another card.',
      },
    ];

    final deliveryFaqs = [
      {
        'q': t.whatAreYourDeliveryHours,
        'a': 'Our delivery fleet operates 24/7 across all covered zones.',
      },
      {
        'q': t.doYouChargeADeliveryFee,
        'a':
            'Delivery fees are calculated dynamically based on distance to the restaurant.',
      },
      {
        'q': t.doYouDeliverToMyLocation,
        'a':
            'Enter your address to check delivery availability and estimated arrival times.',
      },
    ];

    return SliverPadding(
      padding: context.contentInsets(bottom: 32),
      sliver: SliverList.list(
        children: [
          AppText(t.order, style: AppTextStyles.titleMedium(context)),
          12.verticalSpace,
          ...orderFaqs.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: FaqTile(question: f['q']!, answer: f['a']!),
            ),
          ),
          14.verticalSpace,
          AppText(t.payments, style: AppTextStyles.titleMedium(context)),
          12.verticalSpace,
          ...paymentFaqs.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: FaqTile(question: f['q']!, answer: f['a']!),
            ),
          ),
          14.verticalSpace,
          AppText(t.delivery, style: AppTextStyles.titleMedium(context)),
          12.verticalSpace,
          ...deliveryFaqs.map(
            (f) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: FaqTile(question: f['q']!, answer: f['a']!),
            ),
          ),
        ],
      ),
    );
  }
}
