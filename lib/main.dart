import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/Routes/index.dart';
import 'package:flutter_widgets_app/pages/Expanded.dart';
import 'package:flutter_widgets_app/pages/animation.dart';
import 'package:flutter_widgets_app/pages/pageview.dart';
import 'package:flutter_widgets_app/pages/wrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/main_listTile.dart';
import 'demo_pages/mapdemo_page.dart';
import 'pages/safearea.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 1),
      ),
      home: const MyHomePage(title: 'Flutter Widgets Demo'),
      routes: {
        "/safearea": (context) => const SafeAreaPage(),
        "/expanded": (context) => const ExpandedPage(),
        "/wrap": (context) => const WrapPage(),
        "/mapdemo": (context) => MapDemoPage(),
        "/animation": (context) => const AnimationPage(),
        "/pageview": (context) => PageViewPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: routeList.map((route) {
          return MainListTile(
            //「!」はnull許容型の変数に対して、nullでないことを明示的に示す演算子
            //mapはnull許容型を返すので、!をつける必要がある
            title: route["title"]!,
            route: route["route"]!,
          );
        }).toList(),
      ),
    );
  }
}
