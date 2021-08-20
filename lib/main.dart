import 'package:flutter/material.dart';
import 'app.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '纳纳',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.blue[600],
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline3: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline4: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w400, color: Colors.white),
          headline6: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w200, color: Colors.white),
          bodyText1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      home: AppHomePage(),
    );
  }
}
