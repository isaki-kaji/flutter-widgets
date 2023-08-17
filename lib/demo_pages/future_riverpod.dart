import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/states/future_riverpod.dart';

import '../models/index.dart';

class FutureRiverpod extends StatelessWidget {
  const FutureRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FutureRiverpod'),
        ),
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              return FutureBuilder<Hello>(
                future: ref.watch(futureRiverpodNotifierProvider.future),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < data.num; i++) Text(data.hello),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                  }
                  return const CircularProgressIndicator();
                },
              );
            },
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              onPressed: () {
                ref.read(futureRiverpodNotifierProvider.notifier).repeatHello();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ));
  }
}
