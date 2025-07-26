import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/features/home/home_view.dart';
import 'package:ni_angelos/features/notifications/notifications_view.dart';
import 'package:ni_angelos/features/profile/profile_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> tabs = [NotificationsView(),HomeView(), ProfileView()];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManager.primaryColor,
        elevation: 0,
        backgroundColor:  Colors.transparent,
        selectedLabelStyle: TextStyle(color: ColorManager.primaryColor),

        // tabs list
        items: [

          // notifications tab
          BottomNavigationBarItem(
            activeIcon:Icon(Icons.notifications_rounded,color: ColorManager.redContainer,),
            backgroundColor: ColorManager.secondaryColor,
            icon: Icon(Icons.notifications_rounded,color: ColorManager.secondaryColor,),
            label: StringsManager.notifications,
          ),

          // home tab
          BottomNavigationBarItem(
            backgroundColor:  ColorManager.bottomNavigationColor,
            activeIcon:Icon(Icons.home_rounded,color: ColorManager.redContainer,),
            icon:Icon(Icons.home_rounded,color: ColorManager.secondaryColor,),
            label: StringsManager.home,
          ),

          // profile tab
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_rounded,color: ColorManager.redContainer,size: 25.sp,),
            backgroundColor: ColorManager.bottomNavigationColor,
            icon: Icon(Icons.person_rounded,color: ColorManager.secondaryColor,size: 25.sp,),
            label: StringsManager.profile,
          ),
        ],

        // tabs navigation
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      // tabs body
      body: Container(child: tabs[currentIndex]),
    );
  }
}
