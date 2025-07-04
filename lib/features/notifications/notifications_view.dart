import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              StringsManager.notifications,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        actions: [Lottie.asset(ImageAssets.notificationAnimation, height: 100)],
        actionsPadding: REdgeInsets.only(right: 16),
      ),
      child: ListView(children: []),
    );
  }
}
