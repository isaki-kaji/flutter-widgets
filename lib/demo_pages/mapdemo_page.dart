import 'package:flutter/material.dart';

class MapDemoPage extends StatelessWidget {
  const MapDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          //boundaryMarginで拡大した時に端っこを中心まで持ってこれる。
          boundaryMargin: const EdgeInsets.all(20.0),
          minScale: 0.1,
          maxScale: 8.0,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: List.generate(100, (rowIndex) {
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
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
