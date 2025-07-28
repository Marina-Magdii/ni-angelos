import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/custom/custom_button.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/custom/custom_textfield.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/users/data/models/users_model.dart';

class ChildDetailsView extends StatefulWidget {
  const ChildDetailsView({super.key});

  @override
  State<ChildDetailsView> createState() => _ChildDetailsViewState();
}

class _ChildDetailsViewState extends State<ChildDetailsView> {
  bool booksPayed = false;
  bool yearPayed = false;

  @override
  Widget build(BuildContext context) {
    User args = ModalRoute.of(context)?.settings.arguments as User;
    return MyCustomScaffold(
      appBarTitle: args.usersData.name,
      withBackArrow: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              annualPayment(),
              SizedBox(height: 8.h),
              bookPayment(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // child image
                  titleText(StringsManager.childImage),
                  CustomContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.close_rounded),
                          color: ColorManager.secondaryColor,
                        ),
                        Text(StringsManager.chooseImage),
                        CustomContainer(
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          child:
                              args.usersData.image != null
                                  ? Image.network(
                                    args.usersData.image!,
                                    width: 50.w,
                                  )
                                  : Image.asset(
                                    ImageAssets.childLogo,
                                    width: 50.w,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // child name
                  Text(StringsManager.childName),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: args.usersData.name ?? "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 8.h),

                  // year
                  titleText(StringsManager.year),
                  CustomDropFormField(
                    labelText: args.usersData.academicYear ?? "",
                    items: [],
                    value: args.usersData.academicYear,
                  ),
                  SizedBox(height: 8.h),

                  // deacon
                  titleText(StringsManager.deacon),
                  CustomDropFormField(
                    value: "",
                    labelText:
                        args.userDetails.isDeacon == 1
                            ? StringsManager.yes
                            : StringsManager.no,
                    items: [],
                  ),
                  SizedBox(height: 8.h),

                  // phone number
                  Text(StringsManager.childNumber),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText:
                        args.usersData.phoneNumber ??
                        args.userDetails.fatherPhoneNumber ??
                        args.userDetails.motherPhoneNumber ??
                        StringsManager.notFound,
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 8.h),

                  // profile id
                  Text(StringsManager.profileId),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "${args.usersData.id ?? ""}",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 8.h),

                  // password
                  Text(StringsManager.profilePass),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: args.usersData.password ?? "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),

                  // save button
                  CustomButton(title: StringsManager.save),
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

  titleText(String title) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8.0),
      child: Text(title),
    );
  }
}
