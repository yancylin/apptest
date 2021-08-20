import 'package:flutter/material.dart';

class ButtonRoute extends StatefulWidget {
  ButtonRoute({Key? key}) : super(key: key);

  @override
  _ButtonRouteState createState() => _ButtonRouteState();
}

class _ButtonRouteState extends State<ButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text("normal"),
          onPressed: _onPressed,
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: _onPressed,
        ),
        OutlinedButton(
          child: Text("normal"),
          onPressed: _onPressed,
        ),
        OutlinedButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: _onPressed,
        ),
        TextButton(
          child: Text("Submit"),
          onPressed: _onPressed,
        ),
        TextButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: _onPressed,
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: _onPressed,
        ),
      ],
    );
  }

  void _onPressed() {
    print("button pressed");
  }
}
