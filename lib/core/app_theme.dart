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
        fontWeight: FontWeight.bold,
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
      titleMedium: TextStyle(
        color: ColorManager.redRoseColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      titleSmall: TextStyle(
        color: ColorManager.titleSmall,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontFamily: StringsManager.ruqaaFont,
        fontSize: 40.sp,
        color: ColorManager.sectionColor,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        color: ColorManager.tuneColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: ColorManager.darkGrey,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      bodySmall: TextStyle(
        color: ColorManager.secondaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
