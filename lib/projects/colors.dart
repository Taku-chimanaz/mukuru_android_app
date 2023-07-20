import 'package:flutter/material.dart';

class MyAppColors {
  static String backgroundColorString = "#ef4e22";
  static Color color = Color(
      int.parse(backgroundColorString.substring(1, 7), radix: 16) + 0xFF000000);
}
