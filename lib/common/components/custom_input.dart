import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/styles/styles.dart';
import 'package:fluttertemplate/common/utils/utils.dart';

/// 输入框
Widget inputTextEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 18,
  bool autofocus = false,
  Color bgColor = AppColors.inputBgColor,
}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.all(Radius.circular(2)),
      border: Border.all(color: AppColors.inputBorderColor, width: 0.5),
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.inputHintStyle,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: AppTextStyles.inputValueStyle,
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
