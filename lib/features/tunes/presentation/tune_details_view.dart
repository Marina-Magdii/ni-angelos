import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_divider.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_tune_quarter.dart';
import 'package:ni_angelos/models/tune_container_model.dart';
import 'package:ni_angelos/models/tune_model.dart';

class TuneDetailsView extends StatelessWidget {
  const TuneDetailsView({super.key});
  final bool showArabic = true;
  final bool showMoaarab = true;
  final bool showCoptic = true;
  static List<String> arabicText = [
    'هذا نص باللغة العربية ١',
    'هذا نص باللغة العربية ٢',
    'هذا نص باللغة العربية ٣',
  ];

  static List<String> englishText = [
    'English paragraph 1',
    'English paragraph 2',
    'English paragraph 3',
  ];

  static List<String> copticText = [
    'ⲡⲁⲣⲁⲅⲣⲁⲫⲟⲥ 1',
    'ⲡⲁⲣⲁⲅⲣⲁⲫⲟⲥ 2',
    'ⲡⲁⲣⲁⲅⲣⲁⲫⲟⲥ 3',
  ];
  static List<TuneContainerModel> options = [
    TuneContainerModel(
      title: StringsManager.recorder1,
      icon: SvgPicture.asset(ImageAssets.recordIcon),
      onTap: () {},
    ),
    TuneContainerModel(
      title: StringsManager.recorder2,
      icon: SvgPicture.asset(ImageAssets.recordIcon),
      onTap: () {},
    ),
    TuneContainerModel(
      title: StringsManager.share,
      icon: SvgPicture.asset(ImageAssets.shareIcon),
      onTap: () {},
    ),
    TuneContainerModel(
      title: StringsManager.pdf,
      icon: SvgPicture.asset(ImageAssets.pdfIcon),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TuneModel;
    return SafeArea(
      child: MyCustomScaffold(
        appBarTitle: args.title,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: REdgeInsets.only(top: 10.0),
              child: SvgPicture.asset(
                ImageAssets.arrowBack,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: options[index].icon,
                          ),
                          Text(options[index].title),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  CustomContainer(
                    child: Row(
                      children: [
                        Text(StringsManager.inCoptic),
                        SvgPicture.asset(ImageAssets.darkCheckIcon),
                        SizedBox(width: 6.w),
                        Text(StringsManager.moaarab),
                        SvgPicture.asset(ImageAssets.darkCheckIcon),
                        SizedBox(width: 6.w),
                        Text(StringsManager.arabic),
                        SvgPicture.asset(ImageAssets.darkCheckIcon),
                        SizedBox(width: 6.w),
                      ],
                    ),
                  ),
                  Expanded(child: CustomDivider()),
                ],
              ),
              Padding(
                padding: REdgeInsets.all(16.0),
                child: Row(
                  children: [
                    if (showArabic) CustomTuneQuarter(texts: arabicText,),
                    if (showMoaarab) CustomTuneQuarter(texts: englishText,),
                    if (showCoptic) CustomTuneQuarter(texts: copticText,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
