import 'package:flutter/material.dart';

class PageScafold extends StatelessWidget {
  const PageScafold(
      {Key? key,
      required this.title,
      required this.body,
      required this.padding})
      : super(key: key);

  final String title;
  final Widget body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: padding
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            )
          : body,
    );
  }
}

class PageInfo {
  PageInfo(
    this.title,
    this.builder, {
    this.withScaffold = true,
    this.padding = true,
  });

  String title;
  WidgetBuilder builder;
  bool withScaffold;
  bool padding;
}

class ListPage extends StatelessWidget {
  const ListPage({Key? key, required this.children}) : super(key: key);

  final List<PageInfo> children;

  @override
  Widget build(BuildContext context) {
    return ListView(children: _generateItem(context));
  }

  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScafold(
        title: page.title,
        body: page.builder(context),
        padding: false,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }
}
