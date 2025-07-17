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
            return SizedBox(
              height: 240.h,
                child: Text(texts[index],
                textDirection: isCoptic
                    ?TextDirection.ltr
                :TextDirection.rtl,
                style: TextStyle(
                  fontFamily: isCoptic?StringsManager.copticFont
                      :StringsManager.fontFamily
                ),),
            );
      }, itemCount: texts.length,),
    );
  }
}
