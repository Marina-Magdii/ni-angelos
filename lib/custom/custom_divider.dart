import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
      child: Row(
        children: [
          Transform.rotate(
            angle: 0.785398, // 45 degrees in radians
            child: Container(
              width: 10.w,
              height: 10.h,
              color:  ColorManager.secondaryColor,
            ),
          ),
          Expanded(
            child: Divider(
              color: ColorManager.secondaryColor,
              thickness: 4.sp,
            ),
          ),
          Transform.rotate(
            angle: 0.785398, // 45 degrees in radians
            child: Container(
              width: 10.w,
              height: 10.h,
              color:  ColorManager.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
