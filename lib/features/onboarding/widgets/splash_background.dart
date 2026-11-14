import 'package:bite_food_delivery/core/extensions/theme_extensions.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBackground extends StatelessWidget {
  final Animation<double> scaleAnimation;

  const SplashBackground({super.key, required this.scaleAnimation});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        // 1. Deep Obsidian / Space-food canvas
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -0.2),
                radius: 1.3,
                colors: dark
                    ? [
                        const Color(0xFF1E1715),
                        const Color(0xFF110F12),
                        const Color(0xFF09080A),
                      ]
                    : [
                        const Color(0xFFFFF7ED),
                        const Color(0xFFFFEDD5),
                        const Color(0xFFFED7AA),
                      ],
              ),
            ),
          ),
        ),

        // 2. Cosmic Aurora Glow Orbs
        Positioned(
          top: -80.h,
          left: -60.w,
          child: Container(
            width: 280.r,
            height: 280.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colors.primary.withValues(alpha: dark ? 0.35 : 0.25),
                  colors.primary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100.h,
          right: -80.w,
          child: Container(
            width: 340.r,
            height: 340.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFFB800).withValues(alpha: dark ? 0.25 : 0.20),
                  const Color(0xFFFFB800).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),

        // 3. Shockwave rings (animated by scaleAnimation)
        Positioned.fill(
          child: Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                width: 70.r,
                height: 70.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.primary.withValues(alpha: 0.22),
                    width: 1.5.r,
                  ),
                ),
              ),
            ),
          ),
        ),

        // 4. Background legacy SVG scaled circles (compatible with tests & asset structure)
        Positioned(
          left: -100.w,
          top: -100.h,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 200.h,
              colorFilter: ColorFilter.mode(
                colors.primary.withValues(alpha: 0.10),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        Positioned(
          right: -100.w,
          bottom: -100.h,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: SvgPicture.asset(
              'assets/svgs/circle.svg',
              height: 200.h,
              colorFilter: ColorFilter.mode(
                colors.primary.withValues(alpha: 0.25),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),

        // 5. Floating Flavor Dust / Stardust Particles
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _SplashStarDustPainter(
                color: colors.primary.withValues(alpha: dark ? 0.4 : 0.25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SplashStarDustPainter extends CustomPainter {
  final Color color;
  _SplashStarDustPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final randomPositions = [
      Offset(size.width * 0.15, size.height * 0.18),
      Offset(size.width * 0.82, size.height * 0.22),
      Offset(size.width * 0.25, size.height * 0.35),
      Offset(size.width * 0.88, size.height * 0.45),
      Offset(size.width * 0.10, size.height * 0.65),
      Offset(size.width * 0.75, size.height * 0.72),
      Offset(size.width * 0.32, size.height * 0.85),
      Offset(size.width * 0.60, size.height * 0.12),
      Offset(size.width * 0.50, size.height * 0.90),
    ];

    for (var i = 0; i < randomPositions.length; i++) {
      final pos = randomPositions[i];
      final radius = (i % 3 + 1.5);
      canvas.drawCircle(pos, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
