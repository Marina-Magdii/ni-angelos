import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/models/child_model.dart';

class CustomChildContainer extends StatelessWidget {
  const CustomChildContainer({super.key,
  required this.childModel});
  final ChildModel childModel;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.childDetails,
        arguments: childModel);
      },
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(childModel.name??"",
            style: Theme.of(context).textTheme.labelMedium,),
            Text(childModel.age??"",
            style: Theme.of(context).textTheme.titleSmall,),
          ],
        ),
        SizedBox(
          width: 8.w,
        ),
        SvgPicture.asset(ImageAssets.boyImage,width: 48.w,),
      ],
    ));
  }
}
