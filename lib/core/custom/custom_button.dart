import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/services/helper_functions.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.onTap,required this.title});
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: widthOfScreen(context),
        child: CustomContainer(
            color: ColorManager.secondaryColor,
            onTap: onTap,
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Center(child: Text(title,          style: Theme.of(context).textTheme.bodyLarge,)),
            )),
      ),
    );
  }
}
