import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _flag = false;

  _click() {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedAlign(
            duration: const Duration(seconds: 3),
            alignment: _flag ? Alignment.topRight : Alignment.bottomLeft,
            child: AnimatedOpacity(
              opacity: _flag ? 0.1 : 1.0,
              duration: const Duration(seconds: 3),
              child: AnimatedSize(
                duration: const Duration(seconds: 3),
                child: Container(
                  width: _flag ? 10 : 100,
                  height: _flag ? 10 : 100,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 10),
            child: _flag ? const FlutterLogo() : const Icon(Icons.apple),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            width: _flag ? 200 : 100,
            height: _flag ? 100 : 200,
            color: _flag ? Colors.red : Colors.blue,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
