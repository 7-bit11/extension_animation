import 'package:extension_animation/animations/fade/animated_fadein.dart';
import 'package:extension_animation/animations/fade/animated_fadeout.dart';
import 'package:flutter/material.dart';

extension WidgetAnimation on Widget {
  /// 淡入动画 [FadeInAnimatedBit]
  Widget fadeIn(
      {Duration? duration,
      Duration? delay,
      Curve? curve,
      Function(AnimationController controller)? onCreate}) {
    return FadeInAnimatedBit(
      duration: duration,
      delay: delay,
      onCreate: onCreate,
      curve: curve,
      child: this,
    );
  }

  /// 淡出动画 [FadeInAnimatedBit]
  Widget fadeOut(
      {Duration? duration,
      Curve? curve,
      Function(AnimationController controller)? onCreate}) {
    return FadeOutAnimatedBit(
      duration: duration,
      onCreate: onCreate,
      curve: curve,
      child: this,
    );
  }
}
