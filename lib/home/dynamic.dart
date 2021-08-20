import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dynamic_item.dart';
import 'dynamic_mock_data.dart';

class DynamicPage extends StatefulWidget {
  DynamicPage({Key? key}) : super(key: key);
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  List _listItems = [];
  int _currentPage = 1;
  static const int PAGE_SIZE = 20;

  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _load() async {
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> _newItems =
        await DynamicMockData.list(_currentPage, PAGE_SIZE);
    this.setState(() {
      if (_currentPage > 1) {
        _listItems += _newItems;
      } else {
        _listItems = _newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        onRefresh: () async {
          _refresh();
        },
        onLoad: () async {
          _load();
        },
        child: ListView.builder(
            itemCount: _listItems.length,
            itemBuilder: (context, index) {
              return DynamicItem(
                _listItems[index]['title'],
                _listItems[index]['imageUrl'],
                _listItems[index]['viewCount'],
              );
            }),
      ),
    );
  }
}
