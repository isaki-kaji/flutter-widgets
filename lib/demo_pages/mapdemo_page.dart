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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SafeArea(
              child: SizedBox(
                //高さを画面幅の70%に設定
                height: MediaQuery.of(context).size.height * 0.7,
                child: InteractiveViewer(
                  constrained: false, // これを追加
                  transformationController: _controller,
                  boundaryMargin: const EdgeInsets.all(20.0),
                  minScale: 1.0,
                  maxScale: 15.0,
                  child: Column(
                    children: List.generate(
                      50,
                      (rowIndex) {
                        return Row(
                          children: List.generate(50, (colIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Container(
                                height: 10,
                                width: 10,
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
          ),
        ],
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
