import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  const FadeTransitionPage({super.key});

  @override
  State<FadeTransitionPage> createState() => _FadeTransitionPageState();
}

class _FadeTransitionPageState extends State<FadeTransitionPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FadeTransition')),
      body: Center(
          child: FadeTransition(
              opacity: _animation,
              child: const FlutterLogo(
                size: 60,
              ))),
    );
  }
}
