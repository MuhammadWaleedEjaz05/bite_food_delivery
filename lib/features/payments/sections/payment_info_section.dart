import 'package:material_ui/material_ui.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';

class PaymentInfoSection extends StatelessWidget {
  const PaymentInfoSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(),
    sliver: SliverToBoxAdapter(
      child: AppFeedback(
        message: AppLocalizations.of(context)!.paymentAtCheckout,
        icon: Icons.credit_card_outlined,
      ),
    ),
  );
}
