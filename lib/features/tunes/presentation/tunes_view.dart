import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_tune_container.dart';
import 'package:ni_angelos/models/tune_model.dart';

class TunesView extends StatelessWidget {
  const TunesView({super.key});
  static TuneModel tuneModel=TuneModel(
      title: "طاي شوري", date: "22 مايو 2025", number: "1");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyCustomScaffold(
        appBarTitle: StringsManager.tunes,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: REdgeInsets.only(top: 10.0),
              child: SvgPicture.asset(ImageAssets.arrowBack,
                width: 24.w,
                height: 24.h,),
            ),
          )
        ],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(StringsManager.firstSemester,),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                    itemBuilder: (context,index){
                      return CustomTuneContainer(tuneModel: tuneModel);
                    }),
              ],
            ),
          ) ),
    );
  }
}
