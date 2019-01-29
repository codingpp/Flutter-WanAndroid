import 'dart:convert';

import 'package:WanAndroid/constant/Constants.dart';
import 'package:WanAndroid/http/Api.dart';
import 'package:WanAndroid/util/NetUtils.dart';
import 'package:WanAndroid/widget/ArticleItem.dart';
import 'package:WanAndroid/widget/EndLine.dart';
import 'package:WanAndroid/widget/SlideView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List listData = new List();
  var bannerData;
  var curPage = 0;
  var listTotalSize = 0;

  ScrollController _controller = new ScrollController();
  TextStyle titleTextStyle = new TextStyle(fontSize: 15.0);
  TextStyle subtitleTextStyle =
      new TextStyle(color: Colors.blue, fontSize: 12.0);

  HomePageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;

      if (maxScroll == pixels && listData.length < listTotalSize) {
        getHomeArticleList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getBanner();
    getHomeArticleList();
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    getBanner();
    getHomeArticleList();
    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        itemCount: listData.length + 1,
        itemBuilder: (context, i) => buildItem(i),
        controller: _controller,
      );
      return new RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  Widget buildItem(int i) {
    if (i == 0) {
      return new Container(
        height: 200,
        child: _bannerView,
      );
    }
    i -= 1;
    var itemData = listData[i];

    if (itemData is String && itemData == Constants.END_LINE_TAG) {
      return new EndLine();
    }

    return new ArticleItem(itemData);
  }

  SlideView _bannerView;

  void getBanner() {
    String bannerUrl = Api.BANNER;
    NetUtils.get(bannerUrl, params: null).then((data) {
      if (data != null) {
        var map = json.decode(data);
        setState(() {
          bannerData = map['data'];
          _bannerView = new SlideView(bannerData);
        });
      }
    }).catchError((e) {});
  }

  void getHomeArticleList() {
    String url = Api.ARTICLE_LIST;
    url += "$curPage/json";

    NetUtils.get(url, params: null).then((data) {
      if (data != null) {
        var temp = json.decode(data);
        Map<String, dynamic> map = temp['data'];

        var _listData = map['datas'];
        listTotalSize = map['total'];

        setState(() {
          List list1 = new List();
          if (curPage == 0) {
            listData.clear();
          }
          curPage++;

          list1.addAll(listData);
          list1.addAll(_listData);

          if (list1.length >= listTotalSize) {
            list1.add(Constants.END_LINE_TAG);
          }
          listData = list1;
        });
      }
    });
  }
}
