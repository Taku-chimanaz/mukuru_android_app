import 'package:flutter/material.dart';

class MyAppColors {
  static String themeColorString = "#ef4e22";
  static String backgroundColorString = '#F5F5F5';
  static String lighterThemeString = "#F5ab99";
  static String whiteSmokeString = "#F5F5F5";
  static String primaryColorString = "#0B0F1A";
  static String borderColorString = "#B9B9B9";

  static Color themeColor = Color(
      int.parse(themeColorString.substring(1, 7), radix: 16) + 0xFF000000);

  static Color backgroundColor = Color(
      int.parse(backgroundColorString.substring(1, 7), radix: 16) + 0xFF000000);

  static Color lighterThemeColor = Color(
      int.parse(lighterThemeString.substring(1, 7), radix: 16) + 0xFF000000);

  static Color whiteSmokeColor = Color(
      int.parse(whiteSmokeString.substring(1, 7), radix: 16) + 0xFF000000);

  static Color borderColor = Color(
      int.parse(borderColorString.substring(1, 7), radix: 16) + 0xFF000000);

  static Color primaryColor = Color(
      int.parse(primaryColorString.substring(1, 7), radix: 16) + 0xFF000000);
}
