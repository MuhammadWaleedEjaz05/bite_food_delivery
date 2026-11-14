import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';

/// Owns only editing state; search/filter decisions live in the feature Cubit.
class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    required this.value,
    required this.hint,
    required this.onChanged,
    required this.onSubmitted,
    required this.clearLabel,
  });
  final String value, hint, clearLabel;
  final ValueChanged<String> onChanged, onSubmitted;
  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController controller = TextEditingController(
    text: widget.value,
  );
  @override
  void didUpdateWidget(covariant AppSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (controller.text != widget.value) {
      controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    onChanged: widget.onChanged,
    onSubmitted: widget.onSubmitted,
    textInputAction: TextInputAction.search,
    onTapOutside: (_) => FocusScope.of(context).unfocus(),
    style: AppTextStyles.bodyMedium(context),
    decoration: InputDecoration(
      hintText: widget.hint,
      hintStyle: AppTextStyles.bodyMedium(context),
      filled: true,
      fillColor: context.appColors.surfaceContainerHighest,
      contentPadding: const EdgeInsets.all(18).r,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: widget.value.isEmpty
          ? null
          : IconButton(
              tooltip: widget.clearLabel,
              onPressed: () => widget.onChanged(''),
              icon: const Icon(Icons.close),
            ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18).r,
        borderSide: BorderSide.none,
      ),
    ),
  );
}
