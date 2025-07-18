import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';

class CustomTitleContainer extends StatelessWidget {
  const CustomTitleContainer({
    super.key,
    required this.title,
    required this.description,
    this.showCoptic = false,
  });
  final String title;
  final String description;
  final bool showCoptic;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Text(title),
        ),
        CustomContainer(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.216,
            height: MediaQuery.of(context).size.height*0.35,
            child: Text(
              description,
              maxLines: 20,
              textDirection: showCoptic ? TextDirection.ltr : TextDirection.rtl,
              style: TextStyle(
                fontFamily: showCoptic?StringsManager.copticFont:StringsManager.fontFamily
              ),
            ),
          ),
        ),
      ],
    );
  }
}
