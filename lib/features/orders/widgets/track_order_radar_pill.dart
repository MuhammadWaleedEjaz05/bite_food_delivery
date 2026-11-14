import 'dart:ui';
import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bite_food_delivery/widgets/app_text.dart';
import 'package:bite_food_delivery/app/theme/app_text_styles.dart';

class TrackOrderRadarPill extends StatefulWidget {
  const TrackOrderRadarPill({
    super.key,
    this.eta = '12-18 min',
    this.statusLabel = 'Courier on the way',
  });

  final String eta;
  final String statusLabel;

  @override
  State<TrackOrderRadarPill> createState() => _TrackOrderRadarPillState();
}

class _TrackOrderRadarPillState extends State<TrackOrderRadarPill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseScale;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _pulseScale = Tween<double>(begin: 0.9, end: 1.5).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOutCubic),
    );

    if (!EnvironmentUtils.isTest) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18).r,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h).r,
          decoration: BoxDecoration(
            color: (dark ? const Color(0xFF141416) : Colors.white).withValues(
              alpha: 0.88,
            ),
            borderRadius: BorderRadius.circular(18).r,
            border: Border.all(
              color: Colors.white.withValues(alpha: dark ? 0.15 : 0.6),
              width: 1.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Row(
            children: [
              // Pulsing live radar beacon dot
              SizedBox(
                width: 12.r,
                height: 12.r,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseScale,
                      builder: (context, _) => Container(
                        width: 12.r * _pulseScale.value,
                        height: 12.r * _pulseScale.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF00C853).withValues(
                            alpha: (1.5 - _pulseScale.value).clamp(0.0, 0.5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 7.r,
                      height: 7.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF00C853),
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              // Delivery info text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      widget.statusLabel,
                      style: AppTextStyles.labelSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 11.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppText(
                      'Estimated arrival: ${widget.eta}',
                      style: AppTextStyles.bodySmall(context).copyWith(
                        color: dark ? Colors.white70 : const Color(0xFF666666),
                        fontSize: 9.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              // Scooter icon badge
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5722),
                  borderRadius: BorderRadius.circular(10).r,
                ),
                child: Icon(
                  Icons.delivery_dining_rounded,
                  size: 16.r,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

