import 'package:flutter/material.dart';
import 'package:WanAndroid/navigation_keep_alive.dart';

void main() => runApp(new WanAndroid());

class WanAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'WanAndroid',
        theme: new ThemeData.dark(),
        home: NavigationKeepAlive());
  }
}
