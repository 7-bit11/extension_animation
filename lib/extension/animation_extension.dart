import 'package:extension_animation/animations/animated_opacity.dart';
import 'package:flutter/material.dart';

extension WidgetAnimation on Widget {
  /// 淡入动画 [AnimatedOpacityBit]
  Widget fadeIn({Duration? duration, Duration? delay}) {
    return AnimatedOpacityBit(
      duration: duration,
      delay: delay,
      child: this,
    );
  }

  /// 淡出动画 [AnimatedOpacityBit]
  Widget fadeOut({Duration? duration}) {
    return AnimatedOpacityBit(
      duration: duration,
      begin: 1,
      end: 0,
      child: this,
    );
  }
}
