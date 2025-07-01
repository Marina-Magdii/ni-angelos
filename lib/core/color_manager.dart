import 'dart:ui';
import 'package:flutter/material.dart';

class ColorManager {
  static const Color bgColor = Color(0xfffef3e2);
  static const Color primaryColor = Color(0xff560702);
  static const Color secondaryColor = Color(0xff5A121A);
  static const Color textFieldColor = Color(0xfffcf0f1);
  static const Color containerColor = Color(0xfffdedd3);
  static const Color containerBorderColor = Color(0xffdbc68c);

  // constants
  static const List<BoxShadow> shadow = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 7, color: Colors.grey),];
  static const List<BoxShadow> whiteShadow = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 7, color: bgColor),
  ];
}
