import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      child: Row(
        children: [
          Transform.rotate(
            angle: 0.785398, // 45 degrees in radians
            child: Container(
              width: 8.w,
              height: 8.h,
              color:  ColorManager.orangeColor,
            ),
          ),
          Expanded(
            child: Divider(
              color: ColorManager.orangeColor,
              thickness: 2.sp,
            ),
          ),
          Transform.rotate(
            angle: 0.785398, // 45 degrees in radians
            child: Container(
              width: 8.w,
              height: 8.h,
              color:  ColorManager.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
