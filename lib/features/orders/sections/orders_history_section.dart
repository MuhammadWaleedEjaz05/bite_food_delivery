import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_feedback.dart';
import 'package:bite_food_delivery/app/routes/app_navigation.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';

class OrdersHistorySection extends StatelessWidget {
  const OrdersHistorySection({super.key});
  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        if (state is! UserLoggedIn) return const SizedBox.shrink();
        final text = AppLocalizations.of(context)!;
        return AppFeedback(
          message: text.orderHistory,
          actionLabel: text.seeAll,
          icon: Icons.history,
          onAction: () => AppNavigation.push(context, '/order_history_screen'),
        );
      },
    ),
  );
}
