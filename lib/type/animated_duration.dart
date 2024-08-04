/// 默认动画时间
class AnimatedDuration {
  static Duration _duration = const Duration(milliseconds: 600);

  static Duration get duration => _duration;

  static void setDuration({int? milliseconds}) {
    _duration = Duration(milliseconds: milliseconds ?? 600);
  }
}
