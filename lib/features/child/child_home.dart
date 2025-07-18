import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_section_container.dart';
import 'package:ni_angelos/models/section_model.dart';

class ChildHome extends StatelessWidget {
  const ChildHome({super.key});
  static List<SectionModel> sections = [
    SectionModel(
      RoutesManager.coptic,
      StringsManager.coptic,
      ImageAssets.copticIcon,
    ),
    SectionModel(
      RoutesManager.tunes,
      StringsManager.tunes,
      ImageAssets.tunesIcon,
    ),
    SectionModel(
      RoutesManager.tunes,
      StringsManager.mahfozat,
      ImageAssets.mahfozatIcon,
    ),
    SectionModel(
      RoutesManager.tunes,
      StringsManager.taks,
      ImageAssets.taksIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // church image
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: ColorManager.shadow,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(ImageAssets.church, fit: BoxFit.fitHeight),
              ),
            ),

            // child image
            Positioned(
              bottom: 0,
              left: 30.sp,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
                child: Image.asset(ImageAssets.childLogo),
              ),
            ),
          ],
        ),

        // just space
        SizedBox(height: 20.h),

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
