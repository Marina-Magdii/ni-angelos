import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ni_angelos/core/custom/custom_button.dart';
import 'package:ni_angelos/core/custom/custom_drop_form_field.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/routes_manager.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/models/attendance_model.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  String? selectedDate;
  String? selectedMonth;
  String? selectedClass;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ar', "").then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      // app bar
      withBackArrow: true,
      appBarTitle: StringsManager.attendance,
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // date of today
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dateOfToday()),

                Text(StringsManager.todayAttendance),
              ],
            ),

            // just space
            SizedBox(height: 30.h),

            // Month dropdown
            CustomDropFormField(
              value: selectedMonth,
              labelText: StringsManager.month,
              items: getMonth(),
              onChanged: (value) {
                setState(() {
                  selectedDate = null;
                  selectedMonth = value ?? DateTime.now().month.toString();
                });
              },
            ),

            // just space
            SizedBox(height: 30.h),

            // choose attendance date
            CustomDropFormField(
              value: selectedDate,
              labelText: StringsManager.attendanceDate,
              items: getThursdays(selectedMonth??DateTime.now().month.toString()),
              onChanged: (value) {
                setState(() {
                  selectedDate = value.toString();
                });
              },
            ),

            // just space
            SizedBox(height: 30.h),

            // class age
            CustomDropFormField(
              value: selectedClass,
              labelText: StringsManager.myClass,
              items: getClass(),
              onChanged: (value){
                selectedClass=value;
              },
            ),

            // just space
            Spacer(),

            // start button
            CustomButton(
              title: StringsManager.start,
              onTap: () {
                final AttendanceModel attendanceModel = AttendanceModel(age: selectedClass,
                date: selectedDate);
                if (selectedDate != null && selectedClass !=null) {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.classAttendance,
                    arguments: attendanceModel,
                  );
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: ColorManager.titleSmall,
                      content: Center(
                        child: Text(StringsManager.pleaseChooseDateAndClass),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  dateOfToday() {
    final now = DateTime.now();
    return "${now.day}/${now.month}/${now.year}";
  }

  getMonth() {
    return List.generate(12, (index) {
      final monthNumber = index + 1;
      final monthName =
          DateFormat.MMMM('ar').format(DateTime(0, monthNumber)).toString();
      return {
        "label": monthName,
        "value": monthNumber.toString(),
        "icon": null,
      };
    });
  }

  getThursdays(String savedMonth) {
    final now = DateTime.now();
    final year = now.year;
    int myMonth = int.parse(savedMonth);
    final daysInMonth = DateTime(year, myMonth + 1, 0).day;

    return List.generate(daysInMonth, (index) {
      final date = DateTime(year, myMonth, index + 1);
      if (date.weekday == DateTime.thursday) {
        final label = "الخميس : ${date.day}/$myMonth/${date.year}";
        return {"label": label, "value": label, "icon": null};
      }
      return {};
    }).where((item) => item.isNotEmpty).toList();
  }

  getClass() {
    return List.generate(3, (index) {
      var classes = [
        StringsManager.kgAge,
        StringsManager.primaryAge,
        StringsManager.secondaryAge,
      ];
      return {"label": classes[index], "value": classes[index], "icon": null};
    });
  }
}
