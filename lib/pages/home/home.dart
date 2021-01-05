import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/components/components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('首页'),
      ),
      body: Container(
        child: Center(
          child: Text('首页'),
        ),
      ),
    );
  }
}
