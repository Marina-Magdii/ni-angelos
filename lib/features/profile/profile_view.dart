import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_container.dart';
import 'package:ni_angelos/custom/custom_divider.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      // app bar title and icon
      appBarTitle: StringsManager.profile,
      actions: [Lottie.asset(ImageAssets.profileAnimation, width: 40.w)],

      // profile content
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // profile image
              profilePicAndName(context),

              // edit and log out
              Padding(
                padding: REdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // log out
                    logOut(context),

                    // dot
                    Padding(
                      padding: REdgeInsets.only(left: 8.0, right: 8, top: 5),
                      child: Icon(
                        Icons.circle_rounded,
                        size: 5.sp,
                        color: ColorManager.redRoseColor,
                      ),
                    ),

                    // edit profile
                    editProfile(context),
                  ],
                ),
              ),

              // divider
              CustomDivider(),

              // next session
              nextSession(context),

              // attendance
              attendance(context),
            ],
          ),
        ),
      ),
    );
  }

  profilePicAndName(BuildContext context) {
    return Column(
      children: [
        // user profile picture
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(ImageAssets.childLogo, width: 80.w),
        ),

        // user name
        Text(
          StringsManager.notificationSender,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        // user id
        Text(StringsManager.userId),
      ],
    );
  }

  editProfile(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: REdgeInsets.only(bottom: 6.0),
            child: Text(
              " ${StringsManager.editProfile} ",
            ),
          ),
        Icon(Icons.edit_rounded),
        ],
      ),
    );
  }

  logOut(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: REdgeInsets.only(bottom: 6.0),
            child: Text(
              " ${StringsManager.logOut} ",
            ),
          ),
          Icon(Icons.logout_rounded)
        ],
      ),
    );
  }

  nextSession(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              StringsManager.nextSession,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.calendar_month_rounded)
            ),
          ],
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 8.0),
          child: CustomContainer(
            child: Text(
              StringsManager.nextSessionDescription,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        CustomDivider(),
      ],
    );
  }

  attendance(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              StringsManager.attendance63,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.event_note_rounded)
            ),
          ],
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.h);
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return CustomContainer(
                verticalPadding: 16,
                horizontalPadding: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(StringsManager.attendDate),
                    SizedBox(width: 4.w,),
                    Icon(Icons.check_box_rounded)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
