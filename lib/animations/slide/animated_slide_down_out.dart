// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:extension_animation/animations/animated.dart';
import 'package:extension_animation/type/animated_duration.dart';
import 'package:flutter/widgets.dart';

/// 上滑动画
class SlideDownOutAnimationBit extends AnimatedBit {
  /// 开始
  final Offset? begin;

  /// 结束
  final Offset? end;

  SlideDownOutAnimationBit({
    super.key,
    this.begin,
    this.end,
    required super.child,
    super.duration,
    super.delay,
    super.onCreate,
    super.curve,
  });

  @override
  _AnimationSlideState createState() => _AnimationSlideState();
}

class _AnimationSlideState extends State<SlideDownOutAnimationBit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _animationFade;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? AnimatedDuration.duration,
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: widget.begin ?? const Offset(0, 0), // 控制动画起始位置 (屏幕下方)
      end: widget.end ?? const Offset(0, 2), // 控制动画结束位置 (屏幕中间)
    ).animate(CurvedAnimation(
        parent: _controller, curve: widget.curve ?? Curves.easeInOut));
    _animationFade = Tween<double>(
      begin: 1, // 控制动画起始位置 (屏幕下方)
      end: 0, // 控制动画结束位置 (屏幕中间)
    ).animate(CurvedAnimation(
        parent: _controller, curve: widget.curve ?? Curves.easeInOut));

    /// 控制器创建成功回调
    widget.onCreate?.call(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() async {
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
    return SlideTransition(
        position: _animation,
        child: AnimatedBuilder(
          animation: _animationFade,
          builder: (context, child) {
            return Opacity(
              opacity: _animationFade.value,
              child: widget.child,
            );
          },
        ));
  }
}
