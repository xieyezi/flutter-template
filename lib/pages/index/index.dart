import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertemplate/common/utils/utils.dart';
import 'package:fluttertemplate/common/values/values.dart';
import 'package:fluttertemplate/global.dart';
import 'package:fluttertemplate/pages/home/home.dart';
import 'package:fluttertemplate/pages/sigin_in/sigin_in.dart';
import 'package:fluttertemplate/pages/welcome/welcome.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 是否展示欢迎页
  bool _isloadWelcomePage = true;

  @override
  void initState() {
    startCountdownTimer();
    super.initState();
  }

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isloadWelcomePage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 保存 ctx
    MyNavigator.ctx = context;
    return LayoutBuilder(
      builder: (context, constraints) {
        // 初始化 ScreenUtil,设计稿为iPhone6的尺寸
        ScreenUtil.init(
          context,
          allowFontScaling: true,
          designSize: Size(DESIGN_DRAFT_WIDTH, DESIGN_DRAFT_HEIGHT),
        );
        // 进入欢迎页1.5s
        // 离线登录，进入首页
        // 否则进入登录页
        return Scaffold(
          body: _isloadWelcomePage == true
              ? WelcomePage()
              : Global.isOfflineLogin == true
                  ? HomePage()
                  : LoginInPage(),
        );
      },
    );
  }
}
