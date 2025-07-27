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
import 'package:ni_angelos/models/child_model.dart';

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
    ChildModel args = ModalRoute.of(context)?.settings.arguments as ChildModel;
    return MyCustomScaffold(
      appBarTitle: args.name,
      withBackArrow: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              annualPayment(),
              SizedBox(height: 8.h,),
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

                  // child name
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

                 titleText(StringsManager.year),
                  CustomDropFormField(
                    labelText: StringsManager.primaryAge,
                    items: [],
                    value: "",
                  ),
                  SizedBox(height: 8.h,),

                 titleText(StringsManager.deacon),
                  CustomDropFormField(
                    value: "",
                    // widget.items.map((item) {
                    //   return DropdownMenuItem<String>(
                    //     alignment: AlignmentDirectional.centerEnd,
                    //     value: item["label"],
                    //     child: Directionality(
                    //       textDirection: TextDirection.rtl,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         children: [
                    //           item["icon"]!=null
                    //               ?SvgPicture.asset(item["icon"]!):SizedBox(),
                    //           SizedBox(width: 4.w),
                    //           Expanded(
                    //             child: Text(
                    //               item["label"]!,
                    //               textDirection: TextDirection.rtl,),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   );
                    // }).toList(),
                    // items: [{"label":"yes"},{ "label":"no"}],
                    labelText: "", items: [],
                  ),                  SizedBox(height: 8.h,),

                  Text(StringsManager.childNumber),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),                  SizedBox(height: 8.h,),

                  Text(StringsManager.profileId),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),                  SizedBox(height: 8.h,),

                  Text(StringsManager.profilePass),
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
  titleText (String title){
    return   Padding(
      padding: REdgeInsets.symmetric(vertical: 8.0),
      child: Text(title),
    );
  }
}
