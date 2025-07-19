import 'package:flutter/material.dart';

class ColorManager {
  // app colors
  static const Color tuneColor = Color(0xff2d090d);
  static const Color primaryColor = Color(0xff560702);
  static const Color redRoseColor = Color(0xff440d14);
  static const Color sectionColor = Color(0xff440d14);
  static const Color secondaryColor = Color(0xff5A121A);
  static const Color redContainer = Color(0xff931f27);
  static const Color titleSmall = Color(0xffA96D74);
  static const Color inActiveColor = Color(0xffc4999e);
  static const Color darkGrey = Color(0xff444444);
  static const Color greyColor = Color(0xff666666);
  static const Color textFieldColor = Color(0xfffcf0f1);
  static const Color dividerColor = Color(0xffeedadc);
  static const Color bottomNavigationColor = Color(0xffffefcc);
  static const Color containerColor = Color(0xfffdedd3);
  static const Color containerBorderColor = Color(0xffdbc68c);
  static const Color orangeColor = Color(0xffbda277);

  // shadows
  static const List<BoxShadow> shadow = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 7, color: Colors.grey),
  ];
  static const List<BoxShadow> lightShadow = [
    BoxShadow(offset: Offset(0, 2), blurRadius: 100, color: containerColor),
  ];
}
