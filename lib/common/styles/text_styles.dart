import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/common/styles/styles.dart';

class AppTextStyles {
  /// (input hint) hint
  static const TextStyle inputHintStyle = TextStyle(
    fontSize: 16,
    color: Color(0xFF666666),
    decoration: TextDecoration.none,
  );

  /// (input value) value
  static const TextStyle inputValueStyle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}
