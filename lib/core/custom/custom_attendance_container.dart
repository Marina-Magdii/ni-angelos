import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';

class CustomAttendanceContainer extends StatefulWidget {
  const CustomAttendanceContainer({super.key, this.onTap,    required this.isSelected,
  });
  final void Function()? onTap;
  final bool isSelected;

  @override
  State<CustomAttendanceContainer> createState() =>
      _CustomAttendanceContainerState();
}

class _CustomAttendanceContainerState extends State<CustomAttendanceContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: isSelected ? ColorManager.secondaryColor : null,
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap?.call();
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
