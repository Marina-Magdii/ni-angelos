import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/models/section_model.dart';

class CustomSectionContainer extends StatelessWidget {
  const CustomSectionContainer({super.key, required this.sectionModel});
  final SectionModel sectionModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(sectionModel.screenName);
      },
      child: Padding(
        padding:REdgeInsets.symmetric(vertical: 6,horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.containerColor,
            borderRadius: BorderRadius.circular(48.r),
            border: Border.all(
                color: ColorManager.containerBorderColor),
            // boxShadow: ColorManager.shadow
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 28),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sectionModel.icon != null
                      ? SvgPicture.asset(
                        sectionModel.icon!,
                        height: 85.h,
                      )
                      : SizedBox.shrink(),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      sectionModel.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
