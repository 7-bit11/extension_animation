import 'package:extension_animation/extension/animation_extension.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

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
  bool _visible = true;

  bool _hide = false;
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
                    ).fadeIn(onCreate: (controller) {
                      this.controller = controller;
                      debugPrint("初始化成功！！！！");
                    })
                  : FadeIn(
                      child: Text(
                        'Hello, World!',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
              ElevatedButton(
                onPressed: () async {
                  await controller?.reverse().then((_) {
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
              IconButton(
                  onPressed: () => setState(() {
                        _isVisible = !_isVisible;
                      }),
                  icon: const Icon(Icons.change_circle))
            ],
          ),
        ),
      ),
    );
  }
}
