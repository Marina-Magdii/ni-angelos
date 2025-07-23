import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_attendance_container.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class ClassAttendanceView extends StatefulWidget {
  const ClassAttendanceView({super.key});

  @override
  State<ClassAttendanceView> createState() => _ClassAttendanceViewState();
}

class _ClassAttendanceViewState extends State<ClassAttendanceView> {
  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.age,
        withBackArrow: true,
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
                children: [
          Text(dateOfToday()),
          GridView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context,index){
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 2.0),
                  child: CustomAttendanceContainer(),
                );
              })
                ],
              ),
        ));
  }
  dateOfToday(){
    String date = "${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}";
    return date;
  }
}
