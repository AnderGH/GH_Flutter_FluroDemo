import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_fluro/pages/homepage.dart';
import 'package:test_fluro/pages/page1.dart';
import 'package:test_fluro/pages/page2.dart';

class MyAppRouter {
  static String root = '/';
  static String page1 = '/page1';
  static String page2 = '/page2';

  /// 配置全局路由
  static void configRouter(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) {
        print('not found route');
        return;
      },
    );

    // 首页，首页默认id是'/'
    var rootHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HomePage(title: '首页1');
    });
    router.define(MyAppRouter.root, handler: rootHandler);

    // 页面1
    router.define(MyAppRouter.page1, handler: Handler(
      handlerFunc: (context, parameters) {
        var title = parameters['title'].first;
        return Page1(title: title);
      },
    ));

    // 页面2
    router.define(MyAppRouter.page2, handler: Handler(
      handlerFunc: (context, parameters) {
        var title = parameters['title'].first;

        // 解码
        var list = List<int>();
        jsonDecode(title).forEach(list.add);
        String value = Utf8Decoder().convert(list);

        return Page2(title: value);
      },
    ));
  }
}
