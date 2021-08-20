import 'package:flutter/material.dart';

class RetrieveStateRoute extends StatelessWidget {
  const RetrieveStateRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('子树中获取State对象'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldState _state = Scaffold.of(context);
                // ignore: deprecated_member_use
                _state.showSnackBar(
                  SnackBar(
                    content: Text('我是SnackBar'),
                  ),
                );
              },
              child: Text('显示SnackBar'),
            );
          },
        ),
      ),
    );
  }
}
