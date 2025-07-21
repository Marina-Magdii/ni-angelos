import 'package:flutter/cupertino.dart';
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
import 'package:ni_angelos/models/child_model.dart';

class ChildDetailsView extends StatefulWidget {
  const ChildDetailsView({super.key});

  @override
  State<ChildDetailsView> createState() => _ChildDetailsViewState();
}

class _ChildDetailsViewState extends State<ChildDetailsView> {
  List<bool> isSelected = [true, false];
  bool isToggled = false;

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
                  Text(StringsManager.childName),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  Text(StringsManager.year),
                  CustomDropFormField(),
                  Text(StringsManager.deacon),
                  CustomDropFormField(),
                  Text(StringsManager.childNumber),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  Text(StringsManager.profileId),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  Text(StringsManager.profilePass),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(8.r),
                    hintText: "",
                    validator: (v) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomContainer(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      color: ColorManager.secondaryColor,
                      child: Padding(
                        padding: REdgeInsets.only(bottom: 6.0),
                        child: Center(
                          child: Text(
                            StringsManager.save,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
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
            value: isToggled,
            onChanged: (bool value) {
              setState(() {
                isToggled = value;
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
            value: isToggled,
            onChanged: (bool value) {
              setState(() {
                isToggled = value;
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
