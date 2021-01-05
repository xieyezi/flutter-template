import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:AiRi/pages/main/store/main_provider.dart';

class MyNavigator {
  // 设置一次 context 方便后面
  static BuildContext ctx;

  // push 新页面
  static Future<T> push<T extends Object>(Widget page, {BuildContext context}) {
    final _ctx = context ?? ctx;
    FocusScope.of(_ctx).requestFocus(FocusNode());
    return Navigator.push(_ctx, MaterialPageRoute(builder: (_ctx) => page));
  }

  // pop 返回
  static pop<T extends Object>({BuildContext context, T data}) {
    final _ctx = context ?? ctx;
    return Navigator.pop(_ctx, data);
  }

  /// 返回根页面
  static void popToRoot({BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// 返回首页
  static void popToHome({BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// 返回并删除当前页面
  static void popAndRemove(Widget page, {int removeCount = 1, BuildContext context}) {
    var index = 0;
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) {
        index++;
        return index > removeCount ? true : false;
      },
    );
  }

  ///  push 新页面并删除当前页面
  static void pushAndRemove(Widget page, {BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // iOS 从底部向上出来的页面
  static present(Widget page, {BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).push(MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));
  }

  // 返回到登录页面，并删除所有页面
  static pushLoginAndRemoveAll(Widget page, {BuildContext context}) {
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) {
        return false;
      },
    );
  }
}
