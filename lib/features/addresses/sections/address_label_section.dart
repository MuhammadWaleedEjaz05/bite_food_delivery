import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_cubit.dart';
import 'package:bite_food_delivery/features/addresses/bloc/address_editor_state.dart';
import 'package:bite_food_delivery/features/addresses/widgets/address_label_chip.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressLabelSection extends StatelessWidget {
  final String? initialLabel;

  const AddressLabelSection({super.key, this.initialLabel});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final labels = [t.home, t.work, t.other];
    final cubit = context.read<AddressEditorCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              t.label,
              style: AppTextStyles.labelMedium(
                context,
              ).copyWith(color: context.appColors.onSurfaceVariant),
            ),
            12.verticalSpace,
            BlocBuilder<AddressEditorCubit, AddressEditorState>(
              buildWhen: (prev, curr) => prev.label != curr.label,
              builder: (context, state) {
                return Wrap(
                  spacing: 12.w,
                  runSpacing: 10.h,
                  children: [
                    for (final l in labels)
                      AddressLabelChip(
                        label: l,
                        isSelected:
                            state.label.toLowerCase() == l.toLowerCase(),
                        onSelected: () => cubit.setLabel(l),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
