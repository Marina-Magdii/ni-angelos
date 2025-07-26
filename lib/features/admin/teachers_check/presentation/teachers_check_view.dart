import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_child_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_search_container.dart';
import 'package:ni_angelos/models/child_model.dart';

class TeachersCheckView extends StatelessWidget {
  const TeachersCheckView({super.key});
  static ChildModel childModel = ChildModel(
    name: StringsManager.boyName,
    age:  StringsManager.age,);

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle:StringsManager.teachersCheck,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomSearchContainer(),
              SizedBox(height: 20.h,),
              ListView.separated(
                separatorBuilder: (context,index){
                  return SizedBox(height: 8.h,);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CustomChildContainer(
                    onCheck: (){},
                    check: true,
                    childModel: childModel,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
