import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/custom/custom_container.dart';

class CustomDropFormField extends StatefulWidget {
  const CustomDropFormField({super.key,required this.labelText,required this.items});
  final String labelText;
  final List<Map<String, String>> items;

  @override
  State<CustomDropFormField> createState() => _CustomDropFormFieldState();
}

class _CustomDropFormFieldState extends State<CustomDropFormField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      verticalPadding: 0,
      horizontalPadding: 0,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField(
          isExpanded: true,
          isDense: true,
          value: selectedValue,
          dropdownColor: ColorManager.containerColor,
          decoration: InputDecoration(
            contentPadding: REdgeInsets.symmetric(horizontal: 4),
            border: InputBorder.none,
            label: Text(widget.labelText),
            labelStyle: Theme.of(context).textTheme.bodySmall,
            fillColor: ColorManager.containerColor,
            filled: true,
          ),
          elevation: 0,
          alignment: AlignmentDirectional.centerEnd,
          icon: Padding(
            padding: REdgeInsetsDirectional.only(start:8.0),
            child: SvgPicture.asset(ImageAssets.arrowDown),
          ),
          items:
              widget.items.map((item) {
                return DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.centerEnd,
                  value: item["label"],
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        item["icon"]!=null
                            ?SvgPicture.asset(item["icon"]!):SizedBox(),
                        SizedBox(width: 4.w),
                        Expanded(
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
