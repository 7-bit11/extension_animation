import 'package:extension_animation/extension/animation_extension.dart';
import 'package:flutter/material.dart';

class FadeExamplePage extends StatefulWidget {
  const FadeExamplePage({super.key});

  @override
  State<FadeExamplePage> createState() => _FadeExamplePageState();
}

class _FadeExamplePageState extends State<FadeExamplePage> {
  bool _isVisible = true;

  AnimationController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("fadeIn&fadeOut")),
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
                    .fadeIn(

                        ///动画时间
                        duration: const Duration(seconds: 1),
                        //延迟时间
                        //delay: const Duration(seconds: 1),
                        //动画曲线
                        curve: Curves.easeInOut)
                    .fadeOut(onCreate: (controller) {
                    this.controller = controller;
                    debugPrint("初始化成功！！！！");
                  })
                : const Text(
                    'Hello, World!',
                    style: TextStyle(color: Colors.red),
                  ).fadeIn(),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await controller?.forward().then((_) {
                  debugPrint("动画执行成功！！");
                });
                controller = null;
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
