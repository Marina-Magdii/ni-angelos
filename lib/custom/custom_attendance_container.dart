import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';

class CustomAttendanceContainer extends StatefulWidget {
  const CustomAttendanceContainer({super.key});

  @override
  State<CustomAttendanceContainer> createState() =>
      _CustomAttendanceContainerState();
}

class _CustomAttendanceContainerState extends State<CustomAttendanceContainer> {
  bool isSelected = false;
  int count=0;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: isSelected?ColorManager.secondaryColor:null,
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          count++;
        });
      },
      color:
          isSelected
              ? ColorManager.inActiveTrackColor
              : ColorManager.containerColor,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(ImageAssets.childLogo, height: 50),
            SizedBox(height: 10.h),
            Text(
              StringsManager.boyName,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    isSelected
                        ? ColorManager.secondaryColor
                        : ColorManager.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
