import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/custom/custom_section_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/routes_manager.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/models/section_model.dart';

class ChildHome extends StatelessWidget {
  const ChildHome({super.key});
  static List<SectionModel> sections = [
    SectionModel(
      screenName: RoutesManager.coptic,
      title: StringsManager.coptic,
      icon: ImageAssets.copticIcon,
    ),
    SectionModel(
      screenName: RoutesManager.tunes,
      title: StringsManager.tunes,
      icon: ImageAssets.tunesIcon,
    ),
    SectionModel(
      screenName: RoutesManager.mahfozat,
      title: StringsManager.mahfozat,
      icon: ImageAssets.mahfozatIcon,
    ),
    SectionModel(
      screenName: RoutesManager.taks,
      title: StringsManager.taks,
      icon: ImageAssets.taksIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // sections
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sections.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return CustomSectionContainer(sectionModel: sections[index]);
                },
              ),
            ),

            // background glowing
            Positioned(
              top: 100.sp,
              bottom: 100.sp,
              right: 110.sp,
              left: 110.sp,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: ColorManager.lightShadow,
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0,
                    stops: [0, 1],
                    colors: [ColorManager.containerColor, Colors.transparent],
                  ),
                ),
              ),
            ),

            // cross image
            Positioned(
              top: 100.sp,
              bottom: 100.sp,
              right: 100.sp,
              left: 100.sp,
              child: SvgPicture.asset(
                ImageAssets.crossLogo,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
