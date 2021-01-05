import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/styles/styles.dart';
import 'package:fluttertemplate/common/utils/utils.dart';

Widget customInputArea({TextEditingController controller, double height, String hintText, bool autoFacus}) {
  return Container(
    height: height ?? duSetHeight(176),
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.inputBorderColor, width: 0.5),
      ),
      child: TextField(
        maxLines: 8,
        maxLength: 300,
        autofocus: autoFacus ?? true,
        controller: controller,
        style: AppTextStyles.inputValueStyle,
        decoration: InputDecoration(
          hintText: hintText ?? '请告诉我们您的问题/建议',
          hintStyle: AppTextStyles.inputHintStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    ),
  );
}
