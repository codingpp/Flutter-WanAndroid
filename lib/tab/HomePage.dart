import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageWidget();
  }
}

class HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('我是首页');
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}
