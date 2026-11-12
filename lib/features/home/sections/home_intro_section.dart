import 'package:bite_food_delivery/core/extensions/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:bite_food_delivery/l10n/app_localizations.dart';
import 'package:bite_food_delivery/features/home/widgets/home_intro.dart';

class HomeIntroSection extends StatelessWidget {
  const HomeIntroSection({super.key});
  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: context.contentInsets(top: 20, bottom: 24),
    sliver: SliverToBoxAdapter(
      child: HomeIntro(
        headline: AppLocalizations.of(context)!.homeHeadline,
        subtitle: AppLocalizations.of(context)!.homeSubtitle,
      ),
    ),
  );
}
