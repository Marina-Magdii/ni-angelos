import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_section_container.dart';
import 'package:ni_angelos/models/section_model.dart';

class ChildHome extends StatelessWidget {
  const ChildHome({super.key});
  static List<SectionModel> sections = [
    SectionModel("screenName", StringsManager.coptic, ImageAssets.copticIcon),

    SectionModel("screenName", StringsManager.tunes, ImageAssets.tunesIcon),
    SectionModel(
      "screenName",
      StringsManager.mahfozat,
      ImageAssets.mahfozatIcon,
    ),
    SectionModel("screenName", StringsManager.taks, ImageAssets.taksIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: ColorManager.shadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              ImageAssets.church,
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height * 0.22,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sections.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return CustomSectionContainer(
                      sectionModel: sections[index],
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: ColorManager.whiteShadow
              ),
            ),
            Positioned(
              top: 90.sp,
              bottom: 90.sp,
              right: 90.sp,
              left: 90.sp,
              child: SvgPicture.asset(
                ImageAssets.crossLogo,
                width: 48.w,
                height: 48.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
