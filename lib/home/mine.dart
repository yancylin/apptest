import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          'images/img4.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
