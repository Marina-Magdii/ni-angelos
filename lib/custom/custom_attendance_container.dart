import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';

class CustomAttendanceContainer extends StatelessWidget {
  const CustomAttendanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: FittedBox(
        child: Column(
          children: [
            SvgPicture.asset(ImageAssets.boyImage,  height: 50),
            Text(
              StringsManager.boyName,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
