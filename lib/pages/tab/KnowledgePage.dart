import 'dart:convert';

import 'package:WanAndroid/http/Api.dart';
import 'package:WanAndroid/util/NetUtils.dart';
import 'package:WanAndroid/util/ToastUtil.dart';
import 'package:flutter/material.dart';

class KnowledgePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KnowledgePageState();
}

class KnowledgePageState extends State<KnowledgePage> {
  var listData;

  @override
  void initState() {
    super.initState();
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
      );

      return listView;
    }
  }

  Widget buildItem(i) {
    var itemData = listData[i];

    Text name = new Text(
      itemData['name'],
      softWrap: true,
      style: new TextStyle(
          fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left,
    );

    List list = itemData['children'];

    String strContent = '';

    for (var value in list) {
      strContent += '${value["name"]}   ';
    }

    Text content = new Text(
      strContent,
      softWrap: true,
      style: new TextStyle(color: Colors.black),
      textAlign: TextAlign.left,
    );

    return new Card(
      elevation: 4.0,
      child: new InkWell(
        onTap: () {
          _onItemClick(itemData);
        },
        child: new Container(
          padding: EdgeInsets.all(15.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: name,
                    ),
                    content,
                  ],
                ),
              ),
              new Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getList() {
    NetUtils.get(Api.TREE, params: null).then((data) {
      var result = json.decode(data);
      setState(() {
        listData = result['data'];
      });
    });
  }

  void _onItemClick(itemData) {
    ToastUtil.showMessage('TODO_跳转');
  }
}
