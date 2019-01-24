import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget userHeader = UserAccountsDrawerHeader(
      accountName: new Text('pan'),
      accountEmail: new Text("gmail"),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: AssetImage(
          'images/avatar.png',
        ),
        radius: 35.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: _search,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userHeader,
            ListTile(
                title: Text('收藏'),
                leading: new CircleAvatar(
                  child: new Icon(Icons.tab),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              title: Text('夜间模式'),
              leading: new CircleAvatar(
                child: new Icon(Icons.wb_sunny),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('设置'),
              leading: new CircleAvatar(
                child: new Icon(Icons.settings),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('关于我们'),
              leading: new CircleAvatar(
                child: new Icon(Icons.info),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('hello:'),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _search() {}

  @override
  bool get wantKeepAlive => true;
}
