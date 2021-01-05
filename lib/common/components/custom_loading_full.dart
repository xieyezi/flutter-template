import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Color(0xFFFCFCFC),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
    ));
  }
}

class MyLoading2Widget extends StatefulWidget {
  final Duration duration;

  const MyLoading2Widget({Key key, this.duration}) : super(key: key);

  @override
  _MyLoading2WidgetState createState() => _MyLoading2WidgetState();
}

class _MyLoading2WidgetState extends State<MyLoading2Widget> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration ?? const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: Image.asset('assets/images/common/loading.png'),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
