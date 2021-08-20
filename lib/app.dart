import 'package:flutter/material.dart';
import 'home/category.dart';
import 'home/dynamic.dart';
// import 'home/mine.dart';
// import 'home/message.dart';
import 'login/login.dart';
import 'example/example.dart';

class AppHomePage extends StatefulWidget {
  AppHomePage({Key? key}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _index = 0;

  List<Widget> _homeWidgets = [
    Example(),
    DynamicPage(),
    CategoryPage(),
    Login(),
  ];

  void _onBottomNagigationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('纳纳Cu'),
      ),
      body: IndexedStack(
        index: _index,
        children: _homeWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onBottomNagigationBarTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '好友'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '案例'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '我'),
        ],
      ),
    );
  }
}
