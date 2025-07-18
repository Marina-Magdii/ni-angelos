import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomRedContainer extends StatelessWidget {
  const CustomRedContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 12.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // dark container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color:
                  ColorManager.secondaryColor, // Dark maroon shadow color
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),

          // red container
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ColorManager.redContainer, // Main red color
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),

          // center widget
          Positioned(
            top: 1,
            bottom: 10,
            left: 5,
            right: 10,
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}
