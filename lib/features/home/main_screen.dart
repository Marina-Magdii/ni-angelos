import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
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
            activeIcon: SvgPicture.asset(ImageAssets.notificationsOn),
            backgroundColor: ColorManager.bottomNavigationColor,
            icon: SvgPicture.asset(ImageAssets.notificationsOff),
            label: StringsManager.notifications,
          ),

          // home tab
          BottomNavigationBarItem(
            backgroundColor:  ColorManager.bottomNavigationColor,
            activeIcon: SvgPicture.asset(ImageAssets.homeOn),
            icon: SvgPicture.asset(ImageAssets.homeOff),
            label: StringsManager.home,
          ),

          // profile tab
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(ImageAssets.profileOn),
            backgroundColor: ColorManager.bottomNavigationColor,
            icon: SvgPicture.asset(ImageAssets.profileOff),
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
