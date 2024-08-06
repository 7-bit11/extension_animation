import 'package:extension_animation/extension/animation_extension.dart';
import 'package:flutter/material.dart';

class SlideExamplePage extends StatefulWidget {
  const SlideExamplePage({super.key});

  @override
  State<SlideExamplePage> createState() => _SlideExamplePageState();
}

class _SlideExamplePageState extends State<SlideExamplePage> {
  bool _isVisible = true;

  AnimationController? controller;
  AnimationController? controller1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SlideExamplePage")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isVisible
                ? Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                  )
                    .sildeUp(

                        ///动画时间
                        duration: const Duration(seconds: 1),
                        //延迟时间
                        //delay: const Duration(seconds: 1),
                        //动画曲线
                        curve: Curves.easeInOut)
                    .fadeIn()
                    .sildeDown(onCreate: (controller) {
                    this.controller = controller;
                    debugPrint("初始化成功！！！！sildeDown");
                  }).fadeOut(onCreate: (controller) {
                    controller1 = controller;
                    debugPrint("初始化成功！！！！sildeDown");
                  })
                : const Text(
                    'Hello, World!',
                    style: TextStyle(color: Colors.red),
                  ).fadeIn(),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                controller1?.forward();
                await controller?.forward().then((_) {
                  debugPrint("动画执行成功！！");
                });
                controller = null;
                controller1 = null;
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Text(_isVisible ? "隐藏" : "显示"),
            ),
          ],
        ),
      ),
    );
  }
}
