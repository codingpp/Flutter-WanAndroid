import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NavigationPageState();
  }
}

class NavigationPageState extends State<NavigationPage> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.green,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 3,
      children: new List.generate(5, (index) {
        return new Center(
            child: new Container(
          padding: EdgeInsets.all(15.0),
          color: Colors.black26,
          child: new Text(
            "Item $index",
            style: new TextStyle(color: colors[index]),
          ),
        ));
      }),
    );
  }
}
