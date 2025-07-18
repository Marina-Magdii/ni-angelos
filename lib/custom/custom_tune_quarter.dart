import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';

class CustomTuneQuarter extends StatelessWidget {
  const CustomTuneQuarter({super.key,required this.texts, this.isCoptic=false});
  final List<String>texts;
  final bool isCoptic;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemBuilder: (context,index){
            return Padding(
              padding: REdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                height: 250.h,
                child: Text(texts[index],
                textDirection: isCoptic
                    ?TextDirection.ltr
                :TextDirection.rtl,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: isCoptic?StringsManager.copticFont
                      :StringsManager.fontFamily
                ),),
              ),
            );
      }, itemCount: texts.length,),
    );
  }
}
