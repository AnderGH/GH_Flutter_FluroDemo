import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:test_fluro/main.dart';
import 'package:test_fluro/router/myAppRouter.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title==null?'HomePage':title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // 参数中不能含有中文
                String routeId = MyAppRouter.page1 + '?title=1';
                MyApp.router.navigateTo(context, routeId, transition: TransitionType.native);
              },
              child: Text('open page'),
            ),
            RaisedButton(
              onPressed: () {
                // 中文转码
                String routeId = MyAppRouter.page2 + '?title=' + jsonEncode(Utf8Encoder().convert('页面2'));
                MyApp.router.navigateTo(context, routeId, transition: TransitionType.native).then((value) {
                  print('回调' + value);
                });
              },
              child: Text('receive back params'),
            ),
          ],
        ),
      ),
    );
  }
}
