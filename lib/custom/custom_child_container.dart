import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/models/child_model.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class CustomChildContainer extends StatelessWidget {
  const CustomChildContainer({super.key,
   this.childModel,
  this.teacherModel});
  final ChildModel? childModel;
  final TeacherModel? teacherModel;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: (){
        Navigator.pushNamed(context,
           childModel!=null? RoutesManager.childDetails:RoutesManager.teacherDetails,
        arguments:  childModel ?? teacherModel);
      },
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(childModel?.name??teacherModel?.name??"",
            style: Theme.of(context).textTheme.labelMedium,),
            Text(childModel?.age??teacherModel?.childrenAge??"",
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
