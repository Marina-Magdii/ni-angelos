import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_attendance_container.dart';
import 'package:ni_angelos/custom/custom_button.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class ClassAttendanceView extends StatefulWidget {
  const ClassAttendanceView({super.key});

  @override
  State<ClassAttendanceView> createState() => _ClassAttendanceViewState();
}

class _ClassAttendanceViewState extends State<ClassAttendanceView> {
  late List<bool> selectedList;
  int classCount = 25;
  int attendance = 0;

  @override
  void initState() {
    super.initState();
    selectedList = List.generate(classCount, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    return MyCustomScaffold(
      // app bar
      appBarTitle: StringsManager.age,
      withBackArrow: true,
      body: Stack(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                // date
                date("$args"),

                // just space
                SizedBox(height: 20.h),

                // class list
                classList(),

                // just space
                SizedBox(height: 180.h),
              ],
            ),
          ),

          // attendance and save button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: ColorManager.containerColor),
              child: Padding(
                padding: REdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    calculateAttendance(),
                    CustomButton(onTap: () {}, title: StringsManager.save),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  date(String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(date), Text(StringsManager.todayDate)],
    );
  }

  dateOfToday() {
    String date =
        "${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}";
    return date;
  }

  classList() {
    return Expanded(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: classCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return CustomAttendanceContainer(
            isSelected: selectedList[index],
            onTap: () {
              setState(() {
                selectedList[index] = !selectedList[index];
                attendance += selectedList[index] ? 1 : -1;
              });
            },
          );
        },
      ),
    );
  }

  calculateAttendance() {
    int absence = classCount - attendance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$absence : ${StringsManager.absenceCount}",
          style: TextStyle(
            fontFamily: StringsManager.fontFamily,
            color: Colors.red,
          ),
        ),
        Text(
          "$attendance : ${StringsManager.attendanceCount}",
          style: TextStyle(color: Colors.green),
        ),
        Text("$classCount : ${StringsManager.classCount}"),
      ],
    );
  }
}
