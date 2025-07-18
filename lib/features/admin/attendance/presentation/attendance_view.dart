import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: true,
        appBarTitle: StringsManager.attendance,
        body: Column(
          
        ));
  }
}
