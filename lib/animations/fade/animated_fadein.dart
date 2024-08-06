// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:extension_animation/animations/animated.dart';
import 'package:extension_animation/type/animated_duration.dart';
import 'package:flutter/material.dart';

/// 淡入动画效果
class FadeInAnimatedBit extends AnimatedBit {
  /// 开始
  final double begin;

  /// 结束
  final double end;

  /// 构造方法
  FadeInAnimatedBit(
      {super.key,
      required super.child,
      super.duration,
      this.begin = 0,
      this.end = 1,
      super.delay,
      super.onCreate,
      super.curve})
      : super();

  @override
  _FadeInAnimatedBitState createState() => _FadeInAnimatedBitState();
}

class _FadeInAnimatedBitState extends State<FadeInAnimatedBit>
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

    if (widget.delay != null) {
      Future.delayed(widget.delay!, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.forward();
    }

    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _controller.forward();
    //   }
    // });
  }

  @override
  void deactivate() {
    //_controller.reverse().then((value) => debugPrint("动画 dispose"));
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    // if (!_isDisposing && _controller.status != AnimationStatus.dismissed) {
    //   _isDisposing = true;
    //   _controller.reverse().then((_) {
    //     _controller.dispose();
    //     super.dispose();
    //   });
    // } else {
    //   _controller.dispose();
    //   super.dispose();
    // }
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
