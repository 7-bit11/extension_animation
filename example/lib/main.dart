import 'package:extension_animation/extension/animation_extension.dart';
import 'package:extension_animation_example/page/fade_example.dart';
import 'package:extension_animation_example/page/slide_example.dart';
import 'package:extension_animation_example/page/slide_out_example.dart';
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
            children: [
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
              const SizedBox(height: 20),
              _buildItem("slideUpOut&slideDownOut", "", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SlideOutExamplePage()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
