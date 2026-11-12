import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/settings/widgets/setting_tile.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingAboutSection extends StatelessWidget {
  const SettingAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return SliverPadding(
      padding: context.contentInsets(bottom: 32),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20).r,
            border: Border.all(color: colors.outlineVariant, width: 1),
          ),
          child: SettingTile(
            icon: Icons.info_outline_rounded,
            title: 'Version',
            subtitle: 'Bite v2.0.0 (Clean Architecture)',
            trailing: AppText(
              'v2.0.0',
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: colors.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
