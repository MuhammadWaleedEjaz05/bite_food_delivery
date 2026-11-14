import 'dart:math' as math;
import 'package:bite_food_delivery/core/utils/environment_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConfettiCelebration extends StatefulWidget {
  const AppConfettiCelebration({super.key});

  @override
  State<AppConfettiCelebration> createState() => _AppConfettiCelebrationState();
}

class _AppConfettiCelebrationState extends State<AppConfettiCelebration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_ConfettiParticle> _particles = [];
  final math.Random _random = math.Random(42);

  static const _palette = [
    Color(0xFFFF5722),
    Color(0xFFFFD700),
    Color(0xFF00C853),
    Color(0xFF29B6F6),
    Color(0xFFFF4081),
    Color(0xFFAB47BC),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    for (var i = 0; i < 24; i++) {
      _particles.add(
        _ConfettiParticle(
          x: _random.nextDouble(),
          startY: -0.2 - _random.nextDouble() * 0.3,
          speed: 0.6 + _random.nextDouble() * 0.8,
          wobbleSpeed: 2.0 + _random.nextDouble() * 3.0,
          size: 6.0 + _random.nextDouble() * 6.0,
          color: _palette[_random.nextInt(_palette.length)],
          rotationSpeed: (_random.nextDouble() - 0.5) * 8.0,
          isCircle: _random.nextBool(),
        ),
      );
    }

    if (!EnvironmentUtils.isTest) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (EnvironmentUtils.isTest) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          if (t >= 1.0) return const SizedBox.shrink();

          return CustomPaint(
            size: Size(double.infinity, 220.h),
            painter: _ConfettiPainter(
              particles: _particles,
              progress: t,
            ),
          );
        },
      ),
    );
  }
}

class _ConfettiParticle {
  final double x;
  final double startY;
  final double speed;
  final double wobbleSpeed;
  final double size;
  final Color color;
  final double rotationSpeed;
  final bool isCircle;

  _ConfettiParticle({
    required this.x,
    required this.startY,
    required this.speed,
    required this.wobbleSpeed,
    required this.size,
    required this.color,
    required this.rotationSpeed,
    required this.isCircle,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> particles;
  final double progress;

  _ConfettiPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final y = (p.startY + progress * p.speed) * size.height;
      if (y < 0 || y > size.height) continue;

      final wobble = math.sin(progress * p.wobbleSpeed * math.pi) * 20.0;
      final x = p.x * size.width + wobble;
      final opacity = (1.0 - progress).clamp(0.0, 1.0);

      final paint = Paint()
        ..color = p.color.withValues(alpha: opacity)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(progress * p.rotationSpeed * math.pi);

      if (p.isCircle) {
        canvas.drawCircle(Offset.zero, p.size / 2, paint);
      } else {
        canvas.drawRect(
          Rect.fromCenter(
            center: Offset.zero,
            width: p.size,
            height: p.size * 0.6,
          ),
          paint,
        );
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

