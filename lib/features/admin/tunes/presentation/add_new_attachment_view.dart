import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_textfield.dart';

class AddNewAttachmentView extends StatelessWidget {
  AddNewAttachmentView({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle: StringsManager.addNewAttachment,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomDropFormField(),
              SizedBox(height: 20.h),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: CustomTextField(
                  borderRadius: BorderRadius.circular(8.r),
                  hintText: StringsManager.attachmentTitle,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(height: 20.h),
              CustomContainer(
                onTap: () {},
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        StringsManager.attachFile,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(ImageAssets.attachIcon),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomContainer(
                    onTap: () {
                      add();
                    },
                    color: ColorManager.secondaryColor,
                    child: Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          StringsManager.add,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  add() {
    if (formKey.currentState?.validate() ?? false) {
      return;
    }
  }
}
