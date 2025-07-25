import 'package:flutter/material.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: ColorManager.titleSmall,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintTextDirection: TextDirection.rtl,
          hintText: StringsManager.search,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          suffixIcon: Icon(Icons.search_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
