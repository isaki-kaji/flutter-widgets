import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 80,
        height: 80,
        child: Card(
          color: Colors.amberAccent,
        ));
  }
}
