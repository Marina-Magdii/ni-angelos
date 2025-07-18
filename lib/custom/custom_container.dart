import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
    );
  }
}
