import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/states/mydata.dart';

class MyData extends StateNotifier<double> {
  MyData() : super(1.0);
  void changeState(state) => this.state = state;
}

final _mapDemoProvider =
    StateNotifierProvider<MyData, double>((ref) => MyData());

class MapDemoPage extends StatelessWidget {
  MapDemoPage({super.key});

  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: InteractiveViewer(
            constrained: false, // これを追加
            transformationController: _controller,
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 1.0,
            maxScale: 15.0,
            child: Column(
              children: List.generate(
                100,
                (rowIndex) {
                  return Row(
                    children: List.generate(100, (colIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: Container(
                          height: 5,
                          width: 5,
                          color: Colors.green,
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => (),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
