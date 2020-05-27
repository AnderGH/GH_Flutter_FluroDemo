import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:test_fluro/router/myAppRouter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 创建全局静态变量
  static final router = Router();

  // 重写无名构造方法
  MyApp() {
    MyAppRouter.configRouter(router);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test fluro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: MyApp.router.generator,
    );
  }
}