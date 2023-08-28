import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final scale = ref.watch(_mapDemoProvider);
                      _controller.value = Matrix4.identity()..scale(scale);
                      return InteractiveViewer(
                        scaleEnabled: false,
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
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Consumer(
                builder: (context, ref, child) {
                  return Slider(
                    value: ref.watch(_mapDemoProvider),
                    onChanged: (value) =>
                        ref.read(_mapDemoProvider.notifier).changeState(value),
                    min: 1.0,
                    max: 15,
                    divisions: 5,
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () => (),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            );
          },
        ));
  }
}
