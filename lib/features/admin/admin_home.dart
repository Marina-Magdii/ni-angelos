import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      body: Column(
        children: [
          Padding(
            padding: REdgeInsets.all(32.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Lottie.asset(
                  ImageAssets.helloAnimation,
                  width: 40.sp,
                  height: 40.sp,
                ),
                Text(
                  StringsManager.hello,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
