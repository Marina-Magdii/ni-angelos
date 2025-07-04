import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_notification.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.notifications,
      actions: [Lottie.asset(ImageAssets.notificationAnimation)],
      child: SingleChildScrollView(
        child: SizedBox(
          height: 300.h,
          child: ListView.builder(
            itemCount: 3,
              itemBuilder: (context, index){
              return CustomNotification(
              );
              }),
        ),
      ),
    );
  }
}
