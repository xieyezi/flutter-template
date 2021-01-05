import 'package:flutter/material.dart';

import 'custom_appbar.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold(
      {String title,
      PreferredSizeWidget appBar,
      Widget body,
      List<Widget> actions,
      AppBarBackType leadType = AppBarBackType.Back,
      WillPopCallback onWillPop,
      Brightness brightness = Brightness.light,
      Widget floatingActionButton,
      Color appBarBackgroundColor = Colors.black,
      Color titleColor,
      bool centerTitle = true,
      FloatingActionButtonLocation floatingActionButtonLocation})
      : super(
          appBar: appBar ??
              MyAppBar(
                brightness: Brightness.light,
                leadingType: leadType,
                onWillPop: onWillPop,
                actions: actions,
                centerTitle: centerTitle,
                title: MyTitle(title ?? '', color: titleColor),
                backgroundColor: appBarBackgroundColor,
              ),
          backgroundColor: Colors.white,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        );
}
