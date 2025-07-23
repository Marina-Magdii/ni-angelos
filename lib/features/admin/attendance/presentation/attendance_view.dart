import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_button.dart';
import 'package:ni_angelos/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
        appBarTitle: StringsManager.attendance,
        body: Padding(
          padding: REdgeInsets.all( 16.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dateOfToday()),

                  Text(StringsManager.todayAttendance),
                ],
              ),
              SizedBox(height: 30.h,),
              CustomDropFormField(labelText: StringsManager.myClass,
                  items: []),
              Spacer(),
              CustomButton(title: StringsManager.start,
              onTap: (){
                Navigator.pushNamed(context, RoutesManager.classAttendance,
                );
              },)
            ],
          ),
        ));
  }
  dateOfToday(){
   String date = "${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}";
    return date;
  }
}
