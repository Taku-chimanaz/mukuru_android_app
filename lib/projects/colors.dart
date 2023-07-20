import 'package:flutter/material.dart';

class MyAppColors {
  static String themeColorString = "#ef4e22";
  static String backgroundColorString = '#F5F5F5';

  static Color themeColor = Color(
      int.parse(themeColorString.substring(1, 7), radix: 16) + 0xFF000000);

  static Color backgroundColor = Color(
      int.parse(backgroundColorString.substring(1, 7), radix: 16) + 0xFF000000);
}
