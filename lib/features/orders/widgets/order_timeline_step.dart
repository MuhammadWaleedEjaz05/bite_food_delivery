import 'dart:io';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';
import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTimelineStep extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;
  final bool isCancelled;

  const OrderTimelineStep({
    super.key,
    required this.title,
    this.subtitle,
    this.isCompleted = false,
    this.isCurrent = false,
    this.isLast = false,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final circleColor = isCancelled
        ? colors.error
        : isCompleted || isCurrent
        ? colors.primary
        : colors.outlineVariant;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32.r,
            child: Column(
              children: [
                Container(
                  width: 24.r,
                  height: 24.r,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? circleColor
                        : isCurrent
                        ? circleColor.withValues(alpha: 0.15)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: circleColor,
                      width: isCurrent ? 2.5 : 2,
                    ),
                  ),
                  child: Center(
                    child: isCancelled
                        ? Icon(Icons.close, size: 14.r, color: colors.error)
                        : isCompleted
                        ? Icon(Icons.check, size: 14.r, color: Colors.white)
                        : isCurrent
                        ? const _TimelinePulseDot()
                        : null,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.r,
                      color: isCompleted
                          ? colors.primary
                          : colors.outlineVariant,
                    ),
                  ),
              ],
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    style: AppTextStyles.titleMedium(context).copyWith(
                      color: isCancelled
                          ? colors.error
                          : isCompleted || isCurrent
                          ? colors.onSurface
                          : colors.onSurfaceVariant,
                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null && subtitle!.isNotEmpty) ...[
                    4.verticalSpace,
                    AppText(
                      subtitle!,
                      style: AppTextStyles.bodyMedium(
                        context,
                      ).copyWith(color: colors.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelinePulseDot extends StatefulWidget {
  const _TimelinePulseDot();

  @override
  State<_TimelinePulseDot> createState() => _TimelinePulseDotState();
}

class _TimelinePulseDotState extends State<_TimelinePulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final scale = 0.85 + (_controller.value * 0.35);
        return Transform.scale(
          scale: scale,
          child: Container(
            width: 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              color: context.appColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: context.appColors.primary.withValues(
                    alpha: 0.4 + (_controller.value * 0.4),
                  ),
                  blurRadius: 5.r,
                  spreadRadius: 1.r,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
