import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_child_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_search_container.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});
  static TeacherModel teacherModel = TeacherModel(
    name: StringsManager.boyName,
    childrenAge: StringsManager.age,
  );

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle: "${StringsManager.teachers} (2)",
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.add_box_rounded, color: ColorManager.secondaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomSearchContainer(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CustomChildContainer(teacherModel: teacherModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
