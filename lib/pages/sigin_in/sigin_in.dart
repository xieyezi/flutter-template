import 'package:flutter/material.dart';
import 'package:fluttertemplate/pages/home/home.dart';
import 'package:fluttertemplate/common/utils/navigator.dart';

class LoginInPage extends StatefulWidget {
  @override
  _LoginInPageState createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => MyNavigator.push(HomePage()),
        child: Container(
          child: Center(
            child: Text('登录页'),
          ),
        ),
      ),
    );
  }
}
