import 'package:bite_food_delivery/app/constants/app_spacing.dart';
import 'package:bite_food_delivery/core/extensions/spacing_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'AppSpacing and AppPadding tokens provide valid scaled dimensions',
    (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, _) => MaterialApp(
            home: Builder(
              builder: (context) {
                // Spacing tokens
                expect(AppSpacing.xxs, greaterThan(0));
                expect(AppSpacing.xs, greaterThan(AppSpacing.xxs));
                expect(AppSpacing.sm, greaterThan(AppSpacing.xs));
                expect(AppSpacing.md, greaterThan(AppSpacing.sm));
                expect(AppSpacing.lg, greaterThan(AppSpacing.md));
                expect(AppSpacing.xl, greaterThan(AppSpacing.lg));
                expect(AppSpacing.xxl, greaterThan(AppSpacing.xl));

                // Gap widgets
                expect(AppSpacing.gapV8, isA<Widget>());
                expect(AppSpacing.gapH8, isA<Widget>());

                // Padding helpers
                expect(AppPadding.allSM.top, equals(AppSpacing.sm));
                expect(AppPadding.allLG.left, equals(AppSpacing.lg));
                expect(AppPadding.card.horizontal, greaterThan(0));
                expect(AppPadding.screen.horizontal, greaterThan(0));
                expect(AppPadding.chip.horizontal, greaterThan(0));
                expect(AppPadding.badge.vertical, greaterThan(0));
                expect(AppPadding.input.horizontal, greaterThan(0));
                expect(AppPadding.button.horizontal, greaterThan(0));

                // Radius helpers
                expect(AppRadius.sm.topLeft.x, greaterThan(0));
                expect(
                  AppRadius.lg.topLeft.x,
                  greaterThan(AppRadius.sm.topLeft.x),
                );
                expect(AppRadius.circular(16).topLeft.x, greaterThan(0));

                // Context extensions
                expect(context.screenGutter.horizontal, greaterThan(0));
                expect(context.cardPadding.horizontal, greaterThan(0));
                expect(
                  context.gutterWith(top: 10, bottom: 20).top,
                  greaterThan(0),
                );

                return const SizedBox();
              },
            ),
          ),
        ),
      );
    },
  );
}
