import 'package:extension_animation/extension/animation_extension.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  bool _isVisible = true;

  AnimationController? controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
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
                          delay: const Duration(seconds: 1),
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
              ElevatedButton(
                onPressed: () async {
                  await controller?.forward().then((_) {
                    debugPrint("动画执行成功！！");
                  });
                  controller = null;

                  //await Future.delayed(Duration(seconds: 2));
                  // setState(() {
                  //   _hide = false;
                  //   _hide = true;
                  // });
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Text("123"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
