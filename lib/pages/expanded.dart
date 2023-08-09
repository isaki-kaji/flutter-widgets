import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expanded"),
        ),
        body: Center(
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Container(
              height: 100,
              //幅を画面幅の1/5にする
              width: mediaWidth / 5,
              color: Colors.blue,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            Container(
              height: 100,
              width: mediaWidth / 5,
              color: Colors.blue,
            ),
          ]),
        ));
  }
}
