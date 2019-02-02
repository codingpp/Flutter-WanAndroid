import 'dart:convert';

import 'package:WanAndroid/http/Api.dart';
import 'package:WanAndroid/pages/NavigationDetailPage.dart';
import 'package:WanAndroid/util/NetUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NavigationPageState();
  }
}

class NavigationPageState extends State<NavigationPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<dynamic> listData;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.tealAccent,
    Colors.deepOrange
  ];

  @override
  void initState() {
    super.initState();
    _getTitleList();
  }

  List<Tab> _getTabs() {
    List<Tab> tabs = new List();
    for (var value in listData) {
      tabs.add(new Tab(
        text: value['name'],
      ));
    }
    return tabs;
  }

  TabController _getTabController() {
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
    if (listData == null || listData.length == 0) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new Scaffold(
        appBar: new AppBar(
          title: new TabBar(
            tabs: _getTabs(),
            isScrollable: true,
            controller: _getTabController(),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
          ),
        ),
        body: new DefaultTabController(
            length: listData.length,
            child: new TabBarView(
              children: listData.map((dynamic itemData) {
                return new NavigationDetailPage(itemData);
              }).toList(),
              controller: _getTabController(),
            )),
      );
    }
  }

  void _getTitleList() {
    NetUtils.get(Api.NAVIGATION_LIST, params: null).then((data) {
      var result = json.decode(data);
      setState(() {
        listData = result['data'];
      });
    });
  }
}
