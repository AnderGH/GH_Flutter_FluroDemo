
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String title;
  Page2({
    Key key,
    @required this.title,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title==null?'Page2':title),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          Navigator.pop(context, 'page2 back');
        }, child: Text('back params'),),
      ),
    );
  }
}
