// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:extension_animation/type/animated_duration.dart';
import 'package:flutter/material.dart';

/// 淡入动画效果
class AnimatedFadeInBit extends StatefulWidget {
  final Widget child;

  /// 动画时长
  final Duration? duration;

  /// 开始时间
  final double begin;

  /// 结束时间
  final double end;

  /// 延迟时间
  final Duration? delay;

  Function(AnimationController controller)? onCreate;

  /// 构造方法
  AnimatedFadeInBit(
      {super.key,
      required this.child,
      this.duration,
      this.begin = 0,
      this.end = 1,
      this.delay,
      this.onCreate})
      : super();

  @override
  _AnimatedFadeInBitState createState() => _AnimatedFadeInBitState();
}

class _AnimatedFadeInBitState extends State<AnimatedFadeInBit>
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
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

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
        print(_animation.value);
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
