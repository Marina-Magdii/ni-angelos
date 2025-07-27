import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/custom/custom_container.dart';
import 'package:ni_angelos/core/custom/custom_red_container.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/models/notification_model.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key, required this.model});
  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      // notification content
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // notification message, sender and time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [titleMessage(context), senderAndTime()],
          ),

          // notification icon
          CustomRedContainer(
            child: Image.asset(ImageAssets.goldCross),
          ),
        ],
      ),
    );
  }

  // notification title message
  titleMessage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.66,
      child: Text(
        model.title,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  // time and sender name
  senderAndTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          calculateTime(),
          style: TextStyle(color: ColorManager.greyColor, fontSize: 14.sp),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
          child: Icon(
            Icons.circle_rounded,
            size: 5.sp,
            color: ColorManager.greyColor,
          ),
        ),
        Text(
          model.senderName,
          style: TextStyle(color: ColorManager.greyColor, fontSize: 14.sp),
        ),
      ],
    );
  }

  // calculate notification time
  String calculateTime() {
    var difference = DateTime.now().difference(model.sentTime);
    String date;
    if (difference.inDays > 0) {
      if (difference.inDays > 30) {
        var dateInt = difference.inDays;
        var months = dateInt % 30;
        return " ${StringsManager.before} $months ${StringsManager.month} ";
      } else {
        date = difference.inDays.toString();
        return " ${StringsManager.before} $date ${StringsManager.day} ";
      }
    } else if (difference.inDays == 0 && difference.inHours > 0) {
      date = difference.inHours.toString();
      return " ${StringsManager.before} $date ${StringsManager.hour} ";
    } else {
      date = difference.inMinutes.toString();
      return " ${StringsManager.before} $date ${StringsManager.min} ";
    }
  }
}
