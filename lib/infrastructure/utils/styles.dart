import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle main(
          {double fontSize = 14, FontWeight fontWeight = FontWeight.bold,Color color = Colors.white}) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
  static TextStyle textGrey(
          {double fontSize = 10,
          FontWeight fontWeight = FontWeight.normal,
          Color color = const Color.fromRGBO(217, 217, 217, 1)}) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
  static TextStyle textGreyAppBar(
          {double fontSize = 14,
          FontWeight fontWeight = FontWeight.bold,
          Color color = const Color.fromRGBO(217, 217, 217, 1)}) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static TextStyle textBig(
          {double fontSize = 32, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
  static TextStyle textTitle(
          {double fontSize = 24, FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
  static TextStyle textButton(
          {double fontSize = 14,
          FontWeight fontWeight = FontWeight.bold,
          Color color = Colors.white}) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
