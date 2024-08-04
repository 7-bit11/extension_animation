import 'package:extension_animation/animations/animated_fadein.dart';
import 'package:extension_animation/animations/animated_fadeout.dart';
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
      Function(AnimationController controller)? onCreate}) {
    return AnimatedFadeOutBit(
      duration: duration,
      onCreate: onCreate,
      child: this,
    );
  }
}
