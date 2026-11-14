import 'dart:async';
import 'package:material_ui/material_ui.dart';

/// Staggers the entrance of list items, cards, and sections with a subtle
/// fade, slide, and scale effect.
class AppStaggeredEntrance extends StatefulWidget {
  const AppStaggeredEntrance({
    super.key,
    required this.child,
    this.index = 0,
    this.delay,
    this.offset = const Offset(0, 0.12),
    this.duration = const Duration(milliseconds: 380),
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final int index;
  final Duration? delay;
  final Offset offset;
  final Duration duration;
  final Curve curve;

  @override
  State<AppStaggeredEntrance> createState() => _AppStaggeredEntranceState();
}

class _AppStaggeredEntranceState extends State<AppStaggeredEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
    _slideAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(curved);
    _scaleAnimation = Tween<double>(begin: 0.96, end: 1.0).animate(curved);

    final delay =
        widget.delay ??
        Duration(milliseconds: (widget.index.clamp(0, 8) * 45).toInt());

    if (delay == Duration.zero) {
      _controller.forward();
    } else {
      _timer = Timer(delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: _fadeAnimation,
    child: SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
    ),
  );
}
