# extension_animation

这是一个flutter开发的动画插件库，能让您快速解决组件的动画添加。

## 入门指南

该插件支持Android&IOS

目前支持：
##### [FadeIn （淡入）](#FadeIn)
##### [FadeOut （淡出）](#FadeOut)
##### [SlideUp （down to up）](#SlideUp)
##### [SlideDown （up to down）](#SlideDown)
##### [SlideUpOut （down to up Out）](#SlideUpOut)
##### [SlideDownOut （up to down Out）](#SlideDownOut)
快速开始：

#### 	FadeIn 
{#FadeIn}
```dart
Container(width: 150,
          height: 150,
          color: Colors.red,)
    .fadeIn(
      ///动画时间
      duration: const Duration(seconds: 1),
      ///延迟时间
      delay: const Duration(seconds: 1),
	    ///动画曲线
      curve: Curves.easeInOut)
```

#### 	FadeOut 
{#FadeOut}
```dart
自己控制FadeOut的时机
//创建一个接收动画控制器
AnimationController? controller;
//组件
Container(width: 150,
          height: 150,
          color: Colors.red,
     ).fadeOut(onCreate: (controller)) {
          this.controller = controller;
          debugPrint("初始化成功！！！！");
     }
//使用
//在您需要执行的时候进行操作
//是用forward开始执行淡出动画
await controller?.forward().then((_) {
    debugPrint("动画执行成功！！");
  });
//如果您在淡出后是替换或者销毁组件
//Warning  必须将controller给清空否则会出现意想不到的问题
controller = null;
```


#### 	SlideUp 
{#SlideUp}
```dart
Container(width: 150,
          height: 150,
          color: Colors.red,)
    .slideUp(
      ///动画时间
      duration: const Duration(seconds: 1),
      ///延迟时间
      delay: const Duration(seconds: 1),
	    ///动画曲线
      curve: Curves.easeInOut)
```

#### 	SlideDown 
{#SlideDown}
```dart
Container(width: 150,
          height: 150,
          color: Colors.red,)
    .slideDown(
      ///动画时间
      duration: const Duration(seconds: 1),
      ///延迟时间
      delay: const Duration(seconds: 1),
	    ///动画曲线
      curve: Curves.easeInOut)
      ///可嵌套使用
    .fadeIn()
```
#### 	SlideUpOut 
{#SlideUpOut}
```dart
//创建一个接收动画控制器
AnimationController? controller;
//组件
Container(width: 150,
          height: 150,
          color: Colors.red,
     ).slideUpOut(onCreate: (controller)) {
          this.controller = controller;
          debugPrint("初始化成功！！！！");
     }
//使用
//在您需要执行的时候进行操作
//是用forward开始执行淡出动画
await controller?.forward().then((_) {
    debugPrint("动画执行成功！！");
  });
//如果您在淡出后是替换或者销毁组件
//Warning  必须将controller给清空否则会出现意想不到的问题
controller = null;
```

#### 	SlideUpDown
{#SlideUpDown}
```dart
//创建一个接收动画控制器
AnimationController? controller;
//组件
Container(width: 150,
          height: 150,
          color: Colors.red,
     ).slideUpDown(onCreate: (controller)) {
          this.controller = controller;
          debugPrint("初始化成功！！！！");
     }
//使用
//在您需要执行的时候进行操作
//是用forward开始执行淡出动画
await controller?.forward().then((_) {
    debugPrint("动画执行成功！！");
  });
//如果您在淡出后是替换或者销毁组件
//Warning  必须将controller给清空否则会出现意想不到的问题
controller = null;
```