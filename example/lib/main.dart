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
              Container(
                width: 150,
                height: 150,
                color: _isVisible ? Colors.red : Colors.blue,
              ).fadeIn(),
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
