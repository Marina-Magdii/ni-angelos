import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_button.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_textfield.dart';
import 'package:ni_angelos/models/teacher_model.dart';

class TeacherDetailsView extends StatefulWidget {
  const TeacherDetailsView({super.key});

  @override
  State<TeacherDetailsView> createState() => _TeacherDetailsViewState();
}

class _TeacherDetailsViewState extends State<TeacherDetailsView>{
  bool booksPayed = false;
  bool yearPayed = false;

  @override
  Widget build(BuildContext context) {
    TeacherModel args = ModalRoute.of(context)?.settings.arguments as TeacherModel;
    return MyCustomScaffold(
      appBarTitle: args.name,
      withBackArrow: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              annualPayment(),
              bookPayment(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(StringsManager.childImage),
                  CustomContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.close_rounded,
                          color: ColorManager.secondaryColor,
                        ),
                        Text(StringsManager.chooseImage),
                        CustomContainer(
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          child: Image.asset(ImageAssets.childLogo, width: 50.w),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text(StringsManager.childName),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 8.h,),

                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: Text(StringsManager.year),
                  ),
                  CustomDropFormField(
                    labelText: StringsManager.age,
                    items: [],
                  ),
                  SizedBox(height: 8.h,),

                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: Text(StringsManager.deacon),
                  ),
                  CustomDropFormField(
                    items: [{"label":"yes"},{ "label":"no"}],
                    labelText: "",
                  ),                  SizedBox(height: 8.h,),

                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: Text(StringsManager.childNumber),
                  ),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),                  SizedBox(height: 8.h,),

                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: Text(StringsManager.profileId),
                  ),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),                  SizedBox(height: 8.h,),

                  Padding(
                    padding: REdgeInsets.symmetric(vertical: 8.0),
                    child: Text(StringsManager.profilePass),
                  ),
                  CustomTextField(
                    obscure: true,
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    isPass: true,
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  CustomButton(title:   StringsManager.save,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // annual payment container
  annualPayment() {
    return CustomContainer(
      color: ColorManager.inActiveColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoSwitch(
            activeTrackColor: ColorManager.titleSmall,
            inactiveTrackColor: ColorManager.inActiveTrackColor,
            value: yearPayed,
            onChanged: (bool value) {
              setState(() {
                yearPayed = value;
              });
            },
          ),
          Spacer(),
          Text(StringsManager.annualPay),
          SizedBox(width: 8.w),
          SvgPicture.asset(ImageAssets.moneyIcon),
        ],
      ),
    );
  }

  // books payment container
  bookPayment() {
    return CustomContainer(
      color: ColorManager.inActiveColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoSwitch(
            activeTrackColor: ColorManager.titleSmall,
            inactiveTrackColor: ColorManager.inActiveTrackColor,
            value: booksPayed,
            onChanged: (bool value) {
              setState(() {
                booksPayed = value;
              });
            },
          ),
          Spacer(),
          Text(StringsManager.bookPay),
          SizedBox(width: 8.w),
          SvgPicture.asset(ImageAssets.bookIcon),
        ],
      ),
    );
  }
}
