import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';

class CustomDropFormField extends StatefulWidget {
  const CustomDropFormField({super.key});

  @override
  State<CustomDropFormField> createState() => _CustomDropFormFieldState();
}

class _CustomDropFormFieldState extends State<CustomDropFormField> {
  String? selectedValue;

  final List<Map<String, String>> items = [
    {'label': StringsManager.tuneRecord, 'icon': ImageAssets.recordIcon},
    {'label': StringsManager.link, 'icon': ImageAssets.shareIcon},
    {'label': StringsManager.image, 'icon': ImageAssets.imageIcon},
    {'label': StringsManager.pdfFile, 'icon': ImageAssets.documentIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField(
          dropdownColor: ColorManager.containerColor,
          decoration: InputDecoration(
            contentPadding: REdgeInsets.symmetric(vertical: 8,horizontal: 8),
            border: InputBorder.none,
            label: Text(StringsManager.attachmentType),
            labelStyle: Theme.of(context).textTheme.bodySmall,
            fillColor: ColorManager.containerColor,
            filled: true,
          ),
          elevation: 0,
          icon: SvgPicture.asset(ImageAssets.arrowDown),
          items:
              items.map((item) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.centerRight,
                  value: item["label"],
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(item["icon"]!),
                        FittedBox(
                          child: Text(
                              item["label"]!,
                            textDirection: TextDirection.rtl,),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
          onChanged: (value) {
            if (!mounted) return;
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
