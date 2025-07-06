import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomRedContainer extends StatelessWidget {
  const CustomRedContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              // dark container
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorManager.secondaryColor, // Dark maroon shadow color
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),

              // red container
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorManager.redContainer, // Main red color
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),

              // center widget
              Positioned(
                top:10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: child)
            ],
          ),
        ),
      ],
    );
  }
}
