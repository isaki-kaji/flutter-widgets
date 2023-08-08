import 'package:flutter/material.dart';

class MainListTile extends StatelessWidget {
  const MainListTile({Key? key, required this.title, required this.route})
      : super(key: key);

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
