import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_class_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      leadingWidth: 20.w,
      appBarTitle: StringsManager.classes,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.add_box_rounded,size: 25.sp,)),
      withBackArrow: true,
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.h);
          },
          itemBuilder: (context, index) {
            return CustomClassContainer();
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
