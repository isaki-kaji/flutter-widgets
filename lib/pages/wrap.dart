import 'package:flutter/material.dart';

import '../components/color_card.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wrap")),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.end,
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            //ColorCardを繰り返す
            for (var i = 0; i < 12; i++) const ColorCard()
          ],
        ),
      ),
    );
  }
}
