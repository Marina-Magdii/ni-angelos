import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_section_container.dart';
import 'package:ni_angelos/models/section_model.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});
  static List<SectionModel> sections = [
    SectionModel(
      screenName: RoutesManager.attendance,
      title: StringsManager.attendance,
    ),
    SectionModel(
      screenName: RoutesManager.classes,
      title: StringsManager.classes,
    ),
    SectionModel(
      screenName: RoutesManager.teachers,
      title: StringsManager.teachers,
    ),
    SectionModel(
      screenName: RoutesManager.children,
      title: StringsManager.children,
    ),
    SectionModel(
      screenName: RoutesManager.teachersCheck,
      title: StringsManager.teachersCheck,
    ),
    SectionModel(
      screenName: RoutesManager.childrenCheck,
      title: StringsManager.childrenCheck,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Center(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return CustomSectionContainer(sectionModel: sections[index]);
            },
          ),
        ),

        // background glowing
        Positioned(
          top: 2.sp,
          bottom: 180.sp,
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
          top: 2.sp,
          bottom: 180.sp,
          right: 100.sp,
          left: 100.sp,
          child: SvgPicture.asset(
            ImageAssets.crossLogo,
            fit: BoxFit.contain,
          ),
        ),
        // background glowing
        Positioned(
          top: 200.sp,
          bottom: 2.sp,
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
          top: 200.sp,
          bottom: 2.sp,
          right: 100.sp,
          left: 100.sp,
          child: SvgPicture.asset(
            ImageAssets.crossLogo,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
