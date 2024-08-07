import 'package:extension_animation/animations/fade/animated_fadein.dart';
import 'package:extension_animation/animations/fade/animated_fadeout.dart';
import 'package:extension_animation/animations/slide/animated_slide_down.dart';
import 'package:extension_animation/animations/slide/animated_slide_up.dart';
import 'package:extension_animation/animations/slide/animated_slide_up_out.dart';
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

  /// 淡出动画 [FadeOutAnimatedBit]
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

  /// 下往上动画 [SlideUpAnimationBit]
  Widget sildeUp(
      {Duration? duration,
      Curve? curve,
      Function(AnimationController controller)? onCreate}) {
    return SlideUpAnimationBit(
      duration: duration,
      onCreate: onCreate,
      curve: curve,
      child: this,
    );
  }

  /// 上往下动画 [SlideDownAnimationBit]
  Widget sildeDown(
      {Duration? duration,
      Curve? curve,
      Function(AnimationController controller)? onCreate}) {
    return SlideDownAnimationBit(
      duration: duration,
      onCreate: onCreate,
      curve: curve,
      child: this,
    );
  }

  /// 下往上动画退出 [SlideDownAnimationBit]
  Widget sildeUpOut(
      {Duration? duration,
      Curve? curve,
      Function(AnimationController controller)? onCreate}) {
    return GestureDetector(
      child: SlideUpOutAnimationBit(
        duration: duration,
        onCreate: onCreate,
        curve: curve,
        child: this,
      ),
    );
  }
}
