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
        padding: const EdgeInsets.only(top: 30.0),
        child: SafeArea(
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final scale = ref.watch(_mapDemoProvider);
                  _controller.value = Matrix4.identity()..scale(scale);
                  return InteractiveViewer(
                    transformationController: _controller,
                    //boundaryMarginで拡大した時に端っこを中心まで持ってこれる。
                    boundaryMargin: const EdgeInsets.all(20.0),
                    minScale: 1.0,
                    maxScale: 15.0,
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
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
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 280.0,
                      child: Consumer(
                        builder: (context, ref, child) {
                          return Slider(
                            value: ref.watch(_mapDemoProvider),
                            onChanged: (value) {
                              ref
                                  .read(_mapDemoProvider.notifier)
                                  .changeState(value);
                            },
                            min: 1.0,
                            max: 15.0,
                          );
                        },
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return FloatingActionButton(
                          onPressed: () => {
                            print(
                              ref.watch(_mapDemoProvider),
                            ),
                          },
                          child: const Icon(Icons.add),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
