import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/models/class_model.dart';

class CustomClassContainer extends StatelessWidget {
  const CustomClassContainer({super.key});
  static ClassModel classModel = ClassModel(age: StringsManager.primaryAge);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.classDetails,
          arguments: classModel,
        );
      },
      child: CustomContainer(
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_forever_outlined, size: 25.sp),
                ),
                SizedBox(width: 4.w),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit_rounded)),
              ],
            ),
            Spacer(),
            Padding(
              padding: REdgeInsets.only(bottom: 8.0),
              child: Text(classModel.age),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(ImageAssets.menuEmptyIcon),
          ],
        ),
      ),
    );
  }
}
