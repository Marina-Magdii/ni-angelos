import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/custom/custom_divider.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/custom/custom_tune_container.dart';
import 'package:ni_angelos/core/services/helper_functions.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/routes_manager.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/models/tune_model.dart';

class MahfozatView extends StatelessWidget {
   MahfozatView({super.key});
  final TuneModel tuneModel = TuneModel(
      title: StringsManager.firstStage,
      date: StringsManager.attendDate,
      number: 1,
      teacher: StringsManager.notificationSender
  );

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.mahfozat,
      withBackArrow: true,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: REdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      StringsManager.manhag,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(width: 8.w,),
                    SvgPicture.asset(
                      ImageAssets.bibleIcon,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: widthOfScreen(context),
                child: CustomContainer(
                  child: Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: Icon(Icons.picture_as_pdf_rounded,size: 35.sp,),
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
                  ),
                ],
              ),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 16.0),
                child: ListView.separated(
                  separatorBuilder: (context,index){
                    return SizedBox(height: 8.h);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CustomTuneContainer(
                      screenName: RoutesManager.copticDetails,
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
    );
  }
}
