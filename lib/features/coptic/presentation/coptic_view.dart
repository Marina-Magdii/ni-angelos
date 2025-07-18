import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_divider.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_tune_container.dart';
import 'package:ni_angelos/models/tune_model.dart';

class CopticView extends StatelessWidget {
  CopticView({super.key});
  final TuneModel tuneModel = TuneModel(
    title: StringsManager.firstStage,
    date: StringsManager.attendDate,
    number: 1,
    teacher: StringsManager.notificationSender
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyCustomScaffold(
        appBarTitle: StringsManager.coptic,
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
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      StringsManager.manhag,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SvgPicture.asset(
                      ImageAssets.awIcon,
                      color: ColorManager.secondaryColor,
                    ),
                  ],
                ),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomContainer(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.documentIcon,
                            color: ColorManager.secondaryColor,
                            width: 35,
                          ),
                          Text(
                            StringsManager.pdf,
                            style: TextStyle(
                              color: ColorManager.secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      StringsManager.sharh,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(width: 5.w),
                    SvgPicture.asset(
                      ImageAssets.menuFillIcon,
                      color: ColorManager.secondaryColor,
                    ),
                  ],
                ),
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CustomTuneContainer(
                        teacher: true,
                        tuneModel: tuneModel,
                        number: index + 1,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
