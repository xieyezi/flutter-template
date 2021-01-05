import 'package:flutter/material.dart';

void actionSheet(BuildContext context, {Function body}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      elevation: 10,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (BuildContext context) {
        return body(context);
      });
}
