import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

class AppFilterDisclosure extends StatelessWidget {
  const AppFilterDisclosure({
    super.key,
    required this.label,
    required this.child,
  });
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) => ExpansionTile(
    maintainState: true,
    tilePadding: const EdgeInsets.symmetric(horizontal: 12).r,
    childrenPadding: const EdgeInsets.all(12).r,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18).r),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18).r,
    ),
    backgroundColor: context.appColors.surfaceContainerLow,
    collapsedBackgroundColor: context.appColors.surfaceContainerLow,
    leading: const Icon(Icons.tune),
    title: AppText(label, style: AppTextStyles.labelLarge(context)),
    children: [child],
  );
}
