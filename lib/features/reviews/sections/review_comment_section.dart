import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/features/reviews/bloc/review_editor_cubit.dart';
import 'package:bite_food_delivery/features/reviews/widgets/review_text_field.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCommentSection extends StatelessWidget {
  const ReviewCommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final t = AppLocalizations.of(context)!;
    final cubit = context.read<ReviewEditorCubit>();

    return SliverPadding(
      padding: context.contentInsets(bottom: 24),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              t.tellUsYourExperience,
              style: AppTextStyles.titleMedium(context),
            ),
            6.verticalSpace,
            AppText(
              t.feedbackOptional,
              style: AppTextStyles.bodyMedium(
                context,
              ).copyWith(color: colors.onSurfaceVariant),
            ),
            12.verticalSpace,
            ReviewTextField(
              hintText: t.tellUsYourExperience,
              onChanged: cubit.setComment,
            ),
          ],
        ),
      ),
    );
  }
}
