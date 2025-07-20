import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.child,this.color,this.onTap});
  final Widget child;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? ColorManager.containerColor,
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
      ),
    );
  }
}
