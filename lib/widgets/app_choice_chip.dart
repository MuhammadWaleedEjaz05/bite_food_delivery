import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => ChoiceChip(
    selected: selected,
    onSelected: onTap == null ? null : (_) => onTap!(),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
    label: AppText(label, style: AppTextStyles.labelLarge(context)),
  );
}
