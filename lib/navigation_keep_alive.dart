import 'package:WanAndroid/pages/HomePage.dart';
import 'package:WanAndroid/pages/MyPage.dart';
import 'package:flutter/material.dart';

class NavigationKeepAlive extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavigationKeepAliveState();
}

class NavigationKeepAliveState extends State<NavigationKeepAlive>
    with SingleTickerProviderStateMixin {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '知识体系',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '公众号',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.navigation,
                color: _bottomNavigationColor,
              ),
              title: Text(
                "导航",
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '项目',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
      ),
    );
  }
}
