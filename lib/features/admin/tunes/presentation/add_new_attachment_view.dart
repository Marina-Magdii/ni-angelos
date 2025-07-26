import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_button.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_textfield.dart';

class AddNewAttachmentView extends StatefulWidget {
  const AddNewAttachmentView({super.key});

  @override
  State<AddNewAttachmentView> createState() => _AddNewAttachmentViewState();
}

class _AddNewAttachmentViewState extends State<AddNewAttachmentView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

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
              CustomDropFormField(
                labelText: StringsManager.attachmentType,
                items: attachTypes(),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 8),
                child: CustomTextField(
                  borderRadius: BorderRadius.circular(8.r),
                  hintText: StringsManager.attachmentTitle,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  controller: titleController,
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
                      Padding(
                        padding: REdgeInsets.only(bottom: 6.0),
                        child: Text(
                          StringsManager.attachFile,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.attachment_rounded,color: ColorManager.secondaryColor,),
                    ],
                  ),
                ),
              ),
              CustomButton(
                title: StringsManager.add,
                onTap: () {
                  add();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  add() async {
    if (formKey.currentState?.validate() ?? false) {
      await Future.delayed(Duration(seconds: 1)); // simulate work
      if (!mounted) return; // Safe usage of context
      Navigator.pop(context);
    }
  }

  attachTypes() {
    final List<Map<dynamic, dynamic>> items = [
      {
        'label': StringsManager.tuneRecord,
        'value': StringsManager.tuneRecord,
        'icon': Icons.mic_rounded,
      },
      {
        'label': StringsManager.link,
        'value': StringsManager.link,
        'icon': Icons.link_rounded,
      },
      {
        'label': StringsManager.image,
        'value': StringsManager.image,
        'icon': Icons.image_outlined,
      },
      {
        'label': StringsManager.pdfFile,
        'value': StringsManager.pdfFile,
        'icon':Icons.file_open_outlined,
      },
    ];
    return items;
  }
}
