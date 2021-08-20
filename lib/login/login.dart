import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _userInfo('images/beianguanlidanwei.png',
                'texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext'),
            _userInfo('images/beianguanlidanwei.png',
                'texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext'),
          ],
        ));
  }

  Widget _userInfo(String imgurl, String text) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                _userImg(imgurl),
                _userName(text),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _userImg(String imgurl) {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
        image: DecorationImage(image: AssetImage(imgurl)),
      ),
      alignment: Alignment.center,
    );
  }

  Widget _userName(String text) {
    return Container(
      width: 200.0,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
