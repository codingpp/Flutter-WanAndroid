import 'dart:convert';

import 'package:WanAndroid/constant/Constants.dart';
import 'package:WanAndroid/http/Api.dart';
import 'package:WanAndroid/util/NetUtils.dart';
import 'package:WanAndroid/widget/ArticleItem.dart';
import 'package:WanAndroid/widget/EndLine.dart';
import 'package:flutter/material.dart';

class ArticleListPage extends StatefulWidget {
  String id;

  ArticleListPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return new ArticleListPageState();
  }
}

class ArticleListPageState extends State<ArticleListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int curPage = 0;

  Map<String, String> map = new Map();
  List listData = new List();
  int listTotalSize = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getArticleList();

    _scrollController.addListener(() {
      var maxScroll = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        _getArticleList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null || listData.isEmpty) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = ListView.builder(
        key: new PageStorageKey(widget.id),
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
        controller: _scrollController,
      );
      return new RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  Widget buildItem(i) {
    var itemData = listData[i];
    if (i == listData.length - 1 &&
        itemData.toString() == Constants.END_LINE_TAG) {
      return new EndLine();
    }

    return new ArticleItem(itemData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _getArticleList() {
    String url = Api.WECHAT_LIST;
    url += "${widget.id}/$curPage/json";
    NetUtils.get(url, params: null).then((data) {
      if (data != null) {
        var result = json.decode(data);
        Map<String, dynamic> map = result['data'];
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

          listData = list1;
        });
      }
    });
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    _getArticleList();
    return null;
  }
}
