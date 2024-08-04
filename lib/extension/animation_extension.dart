import 'package:extension_animation/animations/animated_fadein.dart';
import 'package:flutter/material.dart';

extension WidgetAnimation on Widget {
  /// 淡入动画 [AnimatedFadeInBit]
  Widget fadeIn(
      {Duration? duration,
      Duration? delay,
      Function(AnimationController controller)? onCreate}) {
    return AnimatedFadeInBit(
      duration: duration,
      delay: delay,
      onCreate: onCreate,
      child: this,
    );
  }

  /// 淡出动画 [AnimatedFadeInBit]
  Widget fadeOut(
      {Duration? duration,
      Duration? delay,
      Function(AnimationController controller)? onCreate}) {
    return AnimatedFadeInBit(
      duration: duration,
      begin: 1,
      end: 0,
      child: this,
    );
  }
}
