import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_notification.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/models/notification_model.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});
  final List<NotificationModel> models = [
    NotificationModel(
      title: StringsManager.notificationMsg,
      senderName: StringsManager.notificationSender,
      sentTime: DateTime.now().subtract(Duration(days: 1, minutes: 90)),
    ),
    NotificationModel(
      title: StringsManager.notificationMsg2,
      senderName: StringsManager.notificationSender,
      sentTime: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    NotificationModel(
      title: StringsManager.notificationMsg,
      senderName: StringsManager.notificationSender,
      sentTime: DateTime.now().subtract(Duration(days: 100, minutes: 90)),
    ),
    NotificationModel(
      title: StringsManager.notificationMsg2,
      senderName: StringsManager.notificationSender,
      sentTime: DateTime.now().subtract(Duration(hours: 7, minutes: 5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarTitle: StringsManager.notifications,
      actions: [Lottie.asset(ImageAssets.notificationAnimation)],
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8.h);
                },
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: models.length,
                itemBuilder: (context, index) {
                  return CustomNotification(model: models[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
