import 'package:flutter/material.dart';
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

  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            label: Text(StringsManager.attachmentType),
            labelStyle:  Theme.of(context).textTheme.titleMedium,
            fillColor: ColorManager.containerColor,
            filled: true
          ),
          elevation: 0,
          icon: SvgPicture.asset(ImageAssets.arrowDown),
          items:
              items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
