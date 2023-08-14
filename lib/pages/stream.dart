import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  int _counter = 0;
  final _counterStream = StreamController<int>();

  @override
  void initState() {
    super.initState();
    Consumer(_counterStream);
  }

  @override
  void dispose() {
    _counterStream.close();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _counterStream.sink.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Center(
        child: Text(_counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(),
      ),
    );
  }
}

class Consumer {
  Consumer(StreamController<int> counterStream) {
    counterStream.stream.listen((data) async {
      print("$dataが使われました。");
    });
  }
}
