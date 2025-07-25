import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_child_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_search_container.dart';
import 'package:ni_angelos/models/child_model.dart';

class ChildrenView extends StatelessWidget {
  const ChildrenView({super.key});
  static ChildModel childModel = ChildModel(name: StringsManager.boyName,
      age:  StringsManager.primaryAge,);

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle: "${StringsManager.children} (225)",
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_rounded,size: 25.sp,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit_rounded,size: 25.sp,)),
          SvgPicture.asset(ImageAssets.excelIcon),
        ],
      ),
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
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CustomChildContainer(
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
