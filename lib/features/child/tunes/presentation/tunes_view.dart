import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/helper_functions.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_tune_container.dart';
import 'package:ni_angelos/models/tune_model.dart';

class TunesView extends StatelessWidget {
  const TunesView({super.key});
  static TuneModel tuneModel=TuneModel(
      title: "طاي شوري", date: "22 مايو 2025", number: 1);

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle: StringsManager.tunes,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isAdmin()
                        ?SvgPicture.asset(ImageAssets.addIcon,width: 24.w,height: 24.h,)
                        :SizedBox.shrink(),
                    Text(StringsManager.firstSemester,),
                  ],
                ),
              ),
              Padding(
                padding: REdgeInsets.all(8.0),
                child: ListView.separated(
                    separatorBuilder: (context,index){
                      return SizedBox(height: 8.h);
                    },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                    itemBuilder: (context,index){
                      return CustomTuneContainer(
                        screenName: RoutesManager.tuneDetails,
                          tuneModel: tuneModel,
                      number: index+1,);
                    }),
              ),
            ],
          ),
        ) );
  }
}
