import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.onTap,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderColor,
  });
  final Widget child;
  final Color? color;
  final void Function()? onTap;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? ColorManager.containerColor,
          boxShadow: ColorManager.shadow,
          border: Border.all(color: borderColor ?? ColorManager.containerBorderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),

        // container content
        child: Padding(
          padding: REdgeInsets.symmetric(vertical:verticalPadding?? 8, horizontal:horizontalPadding?? 8),
          child: child,
        ),
      ),
    );
  }
}
