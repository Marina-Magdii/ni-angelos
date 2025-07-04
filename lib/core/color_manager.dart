import 'dart:ui';
import 'package:flutter/material.dart';

class ColorManager {
  // app colors
  static const Color primaryColor = Color(0xff560702);
  static const Color secondaryColor = Color(0xff5A121A);
  static const Color greyColor = Color(0xff666666);
  static const Color textFieldColor = Color(0xfffcf0f1);
  static const Color bgColor = Color(0xfffef3e2);
  static const Color containerColor = Color(0xfffdedd3);
  static const Color containerBorderColor = Color(0xffdbc68c);

  // shadows
  static const List<BoxShadow> shadow = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 7, color: Colors.grey),
  ];
  static const List<BoxShadow> lightShadow = [
    BoxShadow(offset: Offset(0, 1), color: bgColor, blurRadius: 80),
  ];
}
