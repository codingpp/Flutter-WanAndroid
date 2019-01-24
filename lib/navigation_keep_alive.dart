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
        children: <Widget>[],
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
                'Home',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavigationColor),
              ))
        ],
      ),
    );
  }
}
