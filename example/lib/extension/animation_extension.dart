import 'package:extension_animation_example/animations/animated_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension WidgetAnimation on Widget {
  /// 淡入动画 [AnimatedOpacityBit]
  Widget fadeIn({Duration? duration}) {
    return AnimatedOpacityBit(duration: duration, child: this);
  }
}
