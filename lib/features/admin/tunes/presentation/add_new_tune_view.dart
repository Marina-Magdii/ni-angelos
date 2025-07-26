import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_button.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_divider.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_title_container.dart';

class AddNewTuneView extends StatefulWidget {
  const AddNewTuneView({super.key});

  @override
  State<AddNewTuneView> createState() => _AddNewTuneViewState();
}

class _AddNewTuneViewState extends State<AddNewTuneView> {
  bool showArabic = true;
  bool showMoaarab = true;
  bool showCoptic = true;
  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.newTune,
      withBackArrow: true,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [toggleLanguage()],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_rounded)),
                  Expanded(child: CustomDivider()),
                  Text(StringsManager.quarter1),
                ],
              ),
              Row(
                children: [
                  showCoptic
                      ? Expanded(
                        child: CustomTitleContainer(
                          showCoptic: true,
                          title: StringsManager.coptic,
                          description: StringsManager.quarterCoptic,
                        ),
                      )
                      : SizedBox.shrink(),
                  showMoaarab
                      ? Expanded(
                        child: CustomTitleContainer(
                          title: StringsManager.moaarab,
                          description: StringsManager.quarterMoaarab,
                        ),
                      )
                      : SizedBox.shrink(),
                  showArabic
                      ? Expanded(
                        child: CustomTitleContainer(
                          title: StringsManager.arabic,
                          description: StringsManager.quarterArabic,
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_rounded)),
                  Expanded(child: CustomDivider()),
                  Text(StringsManager.quarter2),
                ],
              ),
              Row(
                children: [
                  showCoptic
                      ? Expanded(
                        child: CustomTitleContainer(
                          showCoptic: true,
                          title: StringsManager.coptic,
                          description: StringsManager.dots,
                        ),
                      )
                      : SizedBox.shrink(),
                  showMoaarab
                      ? Expanded(
                        child: CustomTitleContainer(
                          title: StringsManager.moaarab,
                          description: StringsManager.dots,
                        ),
                      )
                      : SizedBox.shrink(),
                  showArabic
                      ? Expanded(
                        child: CustomTitleContainer(
                          title: StringsManager.arabic,
                          description: StringsManager.dots,
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
              Row(
                children: [
                  Expanded(child: CustomDivider()),
                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 16.0),
                    child: CustomContainer(
                      child: Row(
                        children: [
                          Padding(
                            padding: REdgeInsets.only(bottom: 6.0),
                            child: Text(StringsManager.addNewQuarter),
                          ),
                          Icon(
                            Icons.add_rounded,
                            color: ColorManager.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              CustomButton(title:  StringsManager.save,
              onTap: (){},),
            ],
          ),
        ),
      ),
    );
  }

  toggleLanguage() {
    return CustomContainer(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showCoptic = !showCoptic;
              });
            },
            child: Row(
              children: [
                Text(StringsManager.inCoptic),
                showCoptic
                    ? Padding(
                      padding: REdgeInsets.only(top: 4.0),
                  child: Icon(Icons.check_circle_rounded),
                    )
                    : Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.circle_rounded,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                SizedBox(width: 6.w),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showMoaarab = !showMoaarab;
              });
            },
            child: Row(
              children: [
                Text(StringsManager.m),
                showMoaarab
                    ? Padding(
                      padding: REdgeInsets.only(top: 4.0),
                  child: Icon(Icons.check_circle_rounded),
                    )
                    : Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.circle_rounded,
                        color: ColorManager.secondaryColor,
                      ),
                    ),
                SizedBox(width: 6.w),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                showArabic = !showArabic;
              });
            },
            child: Row(
              children: [
                Text(StringsManager.a),
                showArabic
                    ? Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(Icons.check_circle_rounded),
                    )
                    : Padding(
                      padding: REdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.circle_rounded,
                      ),
                    ),
                SizedBox(width: 6.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
