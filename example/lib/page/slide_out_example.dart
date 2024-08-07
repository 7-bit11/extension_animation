import 'package:extension_animation/extension/animation_extension.dart';
import 'package:flutter/material.dart';

class SlideOutExamplePage extends StatefulWidget {
  const SlideOutExamplePage({super.key});

  @override
  State<SlideOutExamplePage> createState() => _SlideOutExamplePageState();
}

class _SlideOutExamplePageState extends State<SlideOutExamplePage> {
  bool _isVisible = true;
  bool _isVisible1 = true;
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
            Row(
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
                        .sildeUpOut(
                            onCreate: (controller) =>
                                this.controller = controller)
                    : const SizedBox(
                        width: 150,
                        height: 150,
                      ).fadeIn(),
                const SizedBox(
                  width: 20,
                ),
                _isVisible1
                    ? Container(
                        width: 150,
                        height: 150,
                        color: Colors.blue,
                      )
                        .sildeDown(

                            ///动画时间
                            duration: const Duration(seconds: 1),
                            //延迟时间
                            //delay: const Duration(seconds: 1),
                            //动画曲线
                            curve: Curves.easeInOut)
                        .fadeIn()
                        .sildeDownOut(
                            onCreate: (controller) => controller1 = controller)
                    : const SizedBox(
                        width: 150,
                        height: 150,
                      ).fadeIn(),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
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
                    child: Text("downToUp ${_isVisible ? "隐藏" : "显示"}"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      await controller1?.forward().then((_) {
                        debugPrint("动画执行成功！！");
                      });
                      controller1 = null;
                      setState(() {
                        _isVisible1 = !_isVisible1;
                      });
                    },
                    child: Text("downToUp ${_isVisible1 ? "隐藏" : "显示"}"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
