import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTuneQuarter extends StatelessWidget {
  const CustomTuneQuarter({super.key,required this.texts});
  final bool showArabic = true;
  final bool showMoaarab = true;
  final bool showCoptic = true;
  final List<String>texts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context,index){
          return Divider();
        },
          itemBuilder: (context,index){
            return SizedBox(
              height: 50.h,
                child: Text(texts[index]));
      }, itemCount: texts.length,),
    );
  }
}
