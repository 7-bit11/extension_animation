# extension_animation

这是一个flutter开发的动画插件库，能让您快速解决组件的动画添加。

## 入门指南

该插件支持Android&IOS

目前支持：
	FadeIn （淡入）
	FadeOut （淡出）
快速开始：
	

```dart
Container(width: 150,
          height: 150,
          color: Colors.red,)
    .fadeIn(
      ///动画时间
      duration: const Duration(seconds: 1),
      ///延迟时间
      delay: const Duration(seconds: 1))
```

