import 'package:extension_animation/extension/animation_extension.dart';
import 'package:extension_animation_example/page/fade_example.dart';
import 'package:extension_animation_example/page/slide_example.dart';
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

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildItem(String nameEn, String nameCn, void Function()? onTap) {
    TextStyle style = const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(nameEn, style: style)),
              Text(nameCn, style: style)
            ],
          )),
    );
  }

  AnimationController? controller;
  bool _isVisible = true;
  List _list = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Plugin example app'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children:
                //     List.generate(2, (index) {
                //   return
                //   _buildItem("example fadeIn&fadeOut", "淡入淡出", () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (_) => const FadeExamplePage()),
                //     );
                //   }).sildeUp();
                // })
                [
              _buildItem("example fadeIn&fadeOut", "淡入淡出", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FadeExamplePage()),
                );
              }).fadeIn(),
              const SizedBox(height: 20),
              _buildItem("example slideUp&slideDown", "下往上，上往下", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SlideExamplePage()),
                );
              }),
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
                      .sildeUpOut(
                          onCreate: (controller) =>
                              this.controller = controller)
                  : const SizedBox(
                      width: 150,
                      height: 150,
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
      ),
    );
  }
}
