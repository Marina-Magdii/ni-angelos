import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_button.dart';
import 'package:ni_angelos/custom/custom_child_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_search_container.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class ChildrenCheckView extends StatelessWidget {
  const ChildrenCheckView({super.key});
  static TeacherModel teacherModel = TeacherModel(
    name: StringsManager.boyName,
    childrenAge: StringsManager.primaryAge,
  );

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
        appBarTitle: StringsManager.childrenCheck,
        body: Padding(
          padding: REdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    CustomSearchContainer(),
                    SizedBox(height: 20.h,),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context,index){
                        return SizedBox(height: 8.h,);
                      },
                      physics: BouncingScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return CustomChildContainer(
                          check: true,
                            onCheck: (){},
                            teacherModel: teacherModel);
                      },
                    ),
                    CustomButton(title: StringsManager.send,onTap: (){},)
                  ],
                ),
          ),
        ));
  }
}
