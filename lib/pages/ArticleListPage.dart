import 'package:flutter/material.dart';

class ArticleListPage extends StatefulWidget {
  String id;

  ArticleListPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return new ArticleListPageState(id);
  }
}

class ArticleListPageState extends State<ArticleListPage>
    with SingleTickerProviderStateMixin {
  var id;

  ArticleListPageState(this.id);

  @override
  Widget build(BuildContext context) {
    return new Text(
      id + "hello",
      style: new TextStyle(color: Colors.green),
    );
  }
}
