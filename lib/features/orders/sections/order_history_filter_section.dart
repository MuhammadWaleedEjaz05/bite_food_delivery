import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_choice_chip.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryFilterSection extends StatelessWidget {
  final bool showCompleted;
  final ValueChanged<bool> onFilterChanged;

  const OrderHistoryFilterSection({
    super.key,
    required this.showCompleted,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SliverPadding(
      padding: context.contentInsets(bottom: 16),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          spacing: 12.r,
          runSpacing: 8.r,
          children: [
            AppChoiceChip(
              label: t.ongoing,
              selected: !showCompleted,
              onTap: () => onFilterChanged(false),
            ),
            AppChoiceChip(
              label: t.history,
              selected: showCompleted,
              onTap: () => onFilterChanged(true),
            ),
          ],
        ),
      ),
    );
  }
}
