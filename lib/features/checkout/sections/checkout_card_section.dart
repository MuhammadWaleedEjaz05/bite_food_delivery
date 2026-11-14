import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/checkout_cubit.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';

class CheckoutCardSection extends StatelessWidget {
  const CheckoutCardSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    final state = context.watch<CheckoutCubit>().state;
    final t = AppLocalizations.of(context)!;
    if ((!cubit.cardsAvailable && !state.cardPending) ||
        state.quote == null ||
        state.orderId != null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverPadding(
      padding: context.contentInsets(),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppPrimaryButton(
              label: state.cardPending ? t.resumeCardPayment : t.payByCard,
              busy: state.busy,
              onTap: () => cubit.payCard(),
            ),
            if (state.cardPending) ...[
              12.verticalSpace,
              AppPrimaryButton(
                label: t.cancelCardPayment,
                onTap: state.busy ? null : () => cubit.payCard(cancel: true),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
