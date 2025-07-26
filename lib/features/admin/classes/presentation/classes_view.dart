import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_class_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.classes,
      leading: InkWell(
        onTap: () {},
        child: SvgPicture.asset(ImageAssets.addIcon, height: 24.h, width: 24.w),
      ),
      withBackArrow: true,
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context,index){
            return SizedBox(height: 8.h);
          },
          itemBuilder: (context, index) {
            return CustomClassContainer();
          }, itemCount: 15,
        ),
      ),
    );
  }
}
