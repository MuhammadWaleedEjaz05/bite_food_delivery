import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/authentication/bloc/user_auth_cubit.dart';
import 'package:bite_food_delivery/widgets/app_primary_button.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditDialog extends StatefulWidget {
  final String title;
  final String initialValue;
  final String fieldKey;

  const ProfileEditDialog({
    super.key,
    required this.title,
    required this.initialValue,
    required this.fieldKey,
  });

  @override
  State<ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: colors.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24).r),
      child: Padding(
        padding: const EdgeInsets.all(20).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  t.editTitle(widget.title),
                  style: AppTextStyles.titleMedium(context),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            16.verticalSpace,
            TextFormField(
              controller: _controller,
              style: AppTextStyles.bodyLarge(context),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ).r,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16).r,
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16).r,
                  borderSide: BorderSide(color: colors.outlineVariant),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16).r,
                  borderSide: BorderSide(color: colors.primary, width: 2),
                ),
              ),
            ),
            20.verticalSpace,
            AppPrimaryButton(
              label: t.save,
              onTap: () {
                final newValue = _controller.text.trim();
                context.read<UserAuthCubit>().updateUserProfile({
                  widget.fieldKey: newValue,
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
