import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';

class CustomTuneQuarter extends StatelessWidget {
  const CustomTuneQuarter({
    super.key,
    required this.texts,
    this.isCoptic = false,
    required this.languages,
  });
  final List<String> texts;
  final bool isCoptic;
  final int languages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: REdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              height: quarterSpaces(),
              child: Text(
                texts[index],
                textDirection: isCoptic ? TextDirection.ltr : TextDirection.rtl,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily:
                      isCoptic
                          ? StringsManager.copticFont
                          : StringsManager.fontFamily,
                ),
              ),
            ),
          );
        },
        itemCount: texts.length,
      ),
    );
  }

  quarterSpaces() {
    if(languages ==3){
      return 255.h;
    }
    else if (languages == 2){
      return 165.h;
    }
    return 70.h;
  }
}
