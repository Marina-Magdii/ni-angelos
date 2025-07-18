import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/helper_functions.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
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
      body: isAdmin() ? AdminHome() : ChildHome(),
    );
  }
}
