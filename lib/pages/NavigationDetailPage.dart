import 'dart:math';

import 'package:WanAndroid/pages/ArticleDetailPage.dart';
import 'package:flutter/material.dart';

class NavigationDetailPage extends StatefulWidget {
  dynamic itemData;

  NavigationDetailPage(this.itemData);

  @override
  State<StatefulWidget> createState() {
    return new NavigationDetailPageState();
  }
}

class NavigationDetailPageState extends State<NavigationDetailPage> {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.cyanAccent,
    Colors.greenAccent,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    var data = widget.itemData['articles'];
    return new GridView.count(
      crossAxisCount: 3,
      children: new List.generate(data.length, (index) {
        return new GestureDetector(
            onTap: () {
              _itemClick(data[index]);
            },
            child: new Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.black12,
                child: new Center(
                  child: new Text(
                    "${data[index]['title']}",
                    style: new TextStyle(
                        color: colors[random.nextInt(colors.length - 1)],
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                )));
      }),
    );
  }

  void _itemClick(data) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new ArticleDetailPage(
        title: data['title'],
        url: data['link'],
      );
    }));
  }
}
