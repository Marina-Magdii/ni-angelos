import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerColor,
          boxShadow: ColorManager.shadow,
          border: Border.all(color: ColorManager.containerBorderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),

        // container content
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: child,
        ),
      ),
    );
  }
}
