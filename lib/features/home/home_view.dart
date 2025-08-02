import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/custom/custom_scaffold.dart';
import 'package:ni_angelos/core/utils/color_manager.dart';
import 'package:ni_angelos/core/services/helper_functions.dart';
import 'package:ni_angelos/core/utils/image_assets.dart';
import 'package:ni_angelos/core/utils/strings_manager.dart';
import 'package:ni_angelos/features/admin/admin_home.dart';
import 'package:ni_angelos/features/child/child_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      withBackArrow: false,
      appBarTitle: StringsManager.hello,
      actions: [
        Lottie.asset(ImageAssets.helloAnimation, width: 40.w, height: 40.h),
      ],
      body:
          isAdmin()
              ? AdminHome()
              : Column(
                children: [
                  Stack(
                    children: [
                      // church image
                      Container(
                        width: widthOfScreen(context) * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: ColorManager.shadow,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            ImageAssets.church,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),

                      // child image
                      Positioned(
                        bottom: 0,
                        left: 30.sp,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.17,
                          child: Image.asset(ImageAssets.childLogo),
                        ),
                      ),
                    ],
                  ),

                  // just space
                  SizedBox(height: 20.h),
                  ChildHome(),
                ],
              ),
    );
  }
}
