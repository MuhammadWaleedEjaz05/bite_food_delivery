import 'dart:math' as math;
import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppFlyToCart {
  static GlobalKey? globalCartKey;

  static void fly(
    BuildContext context, {
    GlobalKey? sourceKey,
    Offset? startOffset,
    GlobalKey? targetKey,
    Widget? flyer,
    VoidCallback? onComplete,
  }) {
    if (EnvironmentUtils.isTest) {
      onComplete?.call();
      return;
    }

    final overlay = Overlay.maybeOf(context);
    if (overlay == null) {
      onComplete?.call();
      return;
    }

    Offset start = startOffset ?? Offset.zero;
    if (sourceKey != null && sourceKey.currentContext != null) {
      final box = sourceKey.currentContext!.findRenderObject() as RenderBox?;
      if (box != null && box.hasSize) {
        start = box.localToGlobal(box.size.center(Offset.zero));
      }
    }

    Offset target = Offset(330.w, 60.h);
    final effectiveTargetKey = targetKey ?? globalCartKey;
    if (effectiveTargetKey != null && effectiveTargetKey.currentContext != null) {
      final box = effectiveTargetKey.currentContext!.findRenderObject() as RenderBox?;
      if (box != null && box.hasSize) {
        target = box.localToGlobal(box.size.center(Offset.zero));
      }
    }

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => _FlyToCartOverlay(
        start: start,
        target: target,
        flyer: flyer,
        onFinished: () {
          entry.remove();
          onComplete?.call();
        },
      ),
    );

    overlay.insert(entry);
  }
}

class _FlyToCartOverlay extends StatefulWidget {
  final Offset start;
  final Offset target;
  final Widget? flyer;
  final VoidCallback onFinished;

  const _FlyToCartOverlay({
    required this.start,
    required this.target,
    this.flyer,
    required this.onFinished,
  });

  @override
  State<_FlyToCartOverlay> createState() => _FlyToCartOverlayState();
}

class _FlyToCartOverlayState extends State<_FlyToCartOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    _controller.forward().then((_) => widget.onFinished());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _calculateBezierPoint(double t) {
    final p0 = widget.start;
    final p2 = widget.target;
    // Apex control point arched above both points:
    final p1 = Offset(
      (p0.dx + p2.dx) / 2 + 30.w,
      math.min(p0.dy, p2.dy) - 130.h,
    );

    final oneMinusT = 1.0 - t;
    final x = oneMinusT * oneMinusT * p0.dx +
        2 * oneMinusT * t * p1.dx +
        t * t * p2.dx;
    final y = oneMinusT * oneMinusT * p0.dy +
        2 * oneMinusT * t * p1.dy +
        t * t * p2.dy;

    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final t = _animation.value;
        final position = _calculateBezierPoint(t);
        final scale = (1.2 * (1.0 - t * 0.75)).clamp(0.25, 1.2);
        final rotation = t * 2 * math.pi;
        final opacity = (1.0 - (t - 0.85).clamp(0.0, 0.15) / 0.15);

        return Stack(
          children: [
            // Particle Stardust Sparkle Trail
            for (var i = 1; i <= 3; i++) ...[
              if (t > (i * 0.18))
                _buildTrailDot(t - (i * 0.08), i),
            ],

            // Flying Food Token
            Positioned(
              left: position.dx - 22.r,
              top: position.dy - 22.r,
              child: Opacity(
                opacity: opacity,
                child: Transform.rotate(
                  angle: rotation,
                  child: Transform.scale(
                    scale: scale,
                    child: widget.flyer ??
                        Container(
                          width: 44.r,
                          height: 44.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6D3A), Color(0xFFFF9100)],
                            ),
                            border: Border.all(color: Colors.white, width: 2.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF6D3A).withValues(alpha: 0.55),
                                blurRadius: 16.r,
                                spreadRadius: 2.r,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.fastfood_rounded,
                            size: 24.r,
                            color: Colors.white,
                          ),
                        ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTrailDot(double dotT, int index) {
    if (dotT < 0 || dotT > 1.0) return const SizedBox.shrink();
    final pos = _calculateBezierPoint(dotT);
    final dotSize = (8.0 - index * 2.0).r;

    return Positioned(
      left: pos.dx - dotSize / 2,
      top: pos.dy - dotSize / 2,
      child: Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFFB800).withValues(alpha: (0.8 - index * 0.2)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF9100).withValues(alpha: 0.6),
              blurRadius: 8.r,
            ),
          ],
        ),
      ),
    );
  }
}

