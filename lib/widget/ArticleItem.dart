import 'package:WanAndroid/pages/ArticleDetailPage.dart';
import 'package:WanAndroid/util/ToastUtil.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatefulWidget {
  var itemData;

  bool isSearch;

  String id;

  ArticleItem(var itemData) {
    this.itemData = itemData;
    this.isSearch = false;
  }

  ArticleItem.isFromSearch(var itemData, String id) {
    this.itemData = itemData;
    this.isSearch = true;
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() => new ArticleItemState();
}

class ArticleItemState extends State<ArticleItem> {
  void _handleOnItemCollect(itemData) {
//    _itemCollect(itemData);
  }

  void _itemClick(itemData) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new ArticleDetailPage(
        title: itemData['title'],
        url: itemData['link'],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    bool isCollect = widget.itemData['collect'];

    Row row1 = new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Expanded(
            child: new Row(
          children: <Widget>[
            new Text('作者  '),
            new Text(
              widget.itemData['author'],
              style: new TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        )),
        new Text(widget.itemData['niceDate'])
      ],
    );

    Row title = new Row(
      children: <Widget>[
        new Expanded(
            child: new Text.rich(
          new TextSpan(text: widget.itemData['title']),
          softWrap: true,
          style: new TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.left,
        ))
      ],
    );

    Row chapterName = new Row(
      children: <Widget>[
        new Expanded(
            child: new Text(
          widget.itemData['chapterName'],
          softWrap: true,
          style: new TextStyle(color: Theme.of(context).accentColor),
          textAlign: TextAlign.left,
        )),
        new GestureDetector(
          child: new Icon(Icons.favorite, color: Colors.red),
          onTap: () {
            ToastUtil.showMessage("收藏_TODO");
          },
        )
      ],
    );

    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: row1,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: chapterName,
        )
      ],
    );

    return new Card(
      elevation: 4.0,
      child: new InkWell(
        child: column,
        onTap: () {
          _itemClick(widget.itemData);
        },
      ),
    );
  }
}
