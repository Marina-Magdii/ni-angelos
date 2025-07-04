import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      actionsPadding: REdgeInsets.only(right: 16),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorManager.secondaryColor,
        fontFamily: StringsManager.fontFamily,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: StringsManager.fontFamily,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorManager.secondaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: StringsManager.ruqaaFont,
        fontSize: 40.sp,
        color: ColorManager.secondaryColor,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: ColorManager.textFieldColor,
        fontSize: 20.sp,fontWeight: FontWeight.w500
      )
    ),
  );
}
