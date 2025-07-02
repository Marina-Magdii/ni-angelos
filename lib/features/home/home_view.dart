import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/features/child/child_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              StringsManager.hello,
            ),
          ],
        ),
        actions:[Lottie.asset(
          ImageAssets.helloAnimation,
          width: 40.sp,
          height: 40.sp,
        ) ,],
        actionsPadding: REdgeInsets.only(right: 8),
      ),
      child: ChildHome(),
    );
  }
}
