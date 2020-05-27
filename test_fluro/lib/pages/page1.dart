
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String title;
  Page1({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title==null?'Page1':title),
      ),
    );
  }
}
