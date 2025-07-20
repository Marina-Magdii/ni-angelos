import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class AddNewAttachmentView extends StatelessWidget {
  const AddNewAttachmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
      appBarTitle: StringsManager.addNewAttachment,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Text(StringsManager.attachmentType),
         CustomDropFormField(),
            SizedBox(height: 20.h),
            Text(StringsManager.attachmentTitle),
            CustomContainer(child: Text(StringsManager.attachmentTitle)),
            SizedBox(height: 20.h),
            Text(StringsManager.attachment),
            CustomContainer(child: Row(children: [])),
          ],
        ),
      ),
    );
  }
}
