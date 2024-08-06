// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:extension_animation/animations/animated.dart';
import 'package:flutter/widgets.dart';

class SlideUpAnimationBit extends AnimatedBit {
  SlideUpAnimationBit({
    super.key,
    required super.child,
    super.duration,
    super.begin,
    super.end,
    super.delay,
    super.onCreate,
    super.curve,
  });

  @override
  _AnimationSlideState createState() => _AnimationSlideState();
}

class _AnimationSlideState extends State<SlideUpAnimationBit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 1), // 控制动画起始位置 (屏幕下方)
      end: const Offset(0, 0), // 控制动画结束位置 (屏幕中间)
    ).animate(CurvedAnimation(
        parent: _controller, curve: widget.curve ?? Curves.easeInOut));
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        if (mounted) _controller.forward();
      });
      return;
    }
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
