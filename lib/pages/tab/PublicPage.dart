import 'dart:convert';

import 'package:WanAndroid/http/Api.dart';
import 'package:WanAndroid/pages/ArticleListPage.dart';
import 'package:WanAndroid/util/NetUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PublicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PublicPageState();
}

class PublicPageState extends State<PublicPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<dynamic> listData;

  @override
  void initState() {
    super.initState();
    getList();
  }

  void getList() {
    NetUtils.get(Api.WECHAT_CHAPTER, params: null).then((data) {
      var result = json.decode(data);
      setState(() {
        listData = result['data'];
      });
    });
  }

  List<Tab> getTabs() {
    List<Tab> tabs = new List();
    for (var value in listData) {
      tabs.add(new Tab(
        text: value['name'],
      ));
    }
    return tabs;
  }

  TabController getTabController() {
    if (null == _tabController) {
      _tabController = new TabController(length: listData.length, vsync: this);
    }
    return _tabController;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new Scaffold(
          appBar: new AppBar(
            title: new TabBar(
              tabs: getTabs(),
              isScrollable: true,
              controller: getTabController(),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
            ),
          ),
          body: new DefaultTabController(
            length: listData.length,
            child: new TabBarView(
              children: listData.map((dynamic itemData) {
                return new ArticleListPage(itemData['id'].toString());
              }).toList(),
              controller: getTabController(),
            ),
          ));
    }
  }
}
