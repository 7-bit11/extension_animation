// ignore_for_file: library_private_types_in_public_api

import 'package:extension_animation/type/animated_duration.dart';
import 'package:flutter/material.dart';

/// 淡入动画效果
class AnimatedOpacityBit extends StatefulWidget {
  final Widget child;
  final Duration? duration;

  const AnimatedOpacityBit({
    super.key,
    required this.child,
    this.duration,
  }) : super();

  @override
  _AnimatedOpacityBitState createState() => _AnimatedOpacityBitState();
}

class _AnimatedOpacityBitState extends State<AnimatedOpacityBit>
    with SingleTickerProviderStateMixin {
  /// 动画控制器
  late AnimationController _controller;

  late Animation<double> _animation;

  ///使用默认时间[AnimatedDuration.duration]600ms
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? AnimatedDuration.duration,
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}