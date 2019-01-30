import 'package:flutter/material.dart';

class PublicPage extends StatefulWidget {
  var data;

  @override
  State<StatefulWidget> createState() {
    return new PublicPageState();
  }
}

class PublicPageState extends State<PublicPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Tab> tabs = new List();
  List<dynamic> list;

  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList() {

  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
