// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:extension_animation/type/animated_duration.dart';
import 'package:flutter/material.dart';

/// 淡入动画效果
class FadeOutAnimatedBit extends StatefulWidget {
  final Widget child;

  /// 动画时长
  final Duration? duration;

  /// 开始时间
  final double begin;

  /// 结束时间
  final double end;

  /// 延迟时间
  /// final Duration? delay;
  /// 控制器创建成功回调
  Function(AnimationController controller)? onCreate;

  /// 动画曲线
  final Curve? curve;

  /// 构造方法
  FadeOutAnimatedBit(
      {super.key,
      required this.child,
      this.duration,
      this.begin = 1,
      this.end = 0,
      this.onCreate,
      this.curve})
      : super();

  @override
  _FadeOutAnimatedBitState createState() => _FadeOutAnimatedBitState();
}

class _FadeOutAnimatedBitState extends State<FadeOutAnimatedBit>
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
    );
    _animation = CurvedAnimation(
      parent: Tween<double>(begin: widget.begin, end: widget.end)
          .animate(_controller),
      curve: widget.curve ?? Curves.easeInOut,
    );

    /// 控制器创建成功回调
    widget.onCreate?.call(_controller);
  }

  @override
  void deactivate() {
    super.deactivate();
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