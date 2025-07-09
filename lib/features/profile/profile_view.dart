import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // profile image
            profilePicAndName(context),

            // edit and log out
            Row(
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

            // divider
            CustomDivider(),

            // next session
            nextSession(context),

            // attendance
            attendance(context),
          ],
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
          Text(
            " ${StringsManager.editProfile} ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SvgPicture.asset(ImageAssets.editIcon, width: 25.w),
        ],
      ),
    );
  }

  logOut(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Text(
            " ${StringsManager.logOut} ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SvgPicture.asset(ImageAssets.logOutIcon, width: 25.w),
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
              child: SvgPicture.asset(ImageAssets.calenderIcon),
            ),
          ],
        ),
        Padding(
          padding: REdgeInsets.only(top: 8.0),
          child: CustomContainer(
            child: Text(
              StringsManager.nextSessionDescription,
              style: Theme.of(context).textTheme.labelSmall,
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
              StringsManager.attendance,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(ImageAssets.attendIcon),
            ),
          ],
        ),
        Padding(
          padding: REdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return CustomContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(StringsManager.attendDate),
                    SvgPicture.asset(ImageAssets.checkIcon),
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
