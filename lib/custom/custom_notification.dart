import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerColor,
          boxShadow: ColorManager.shadow,
          border: Border.all(
            color: ColorManager.containerBorderColor
          )
        ),
        child: Row(
          children: [

          ],
        ),
      ),
    );
  }
}
