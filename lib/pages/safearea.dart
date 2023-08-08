import 'package:flutter/material.dart';

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("SafeAreaPage"),
    )));
  }
}
