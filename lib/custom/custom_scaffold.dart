import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ni_angelos/core/image_assets.dart';

class MyCustomScaffold extends StatelessWidget {
  const MyCustomScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBarTitle,
    this.actions,
    this.leading,
    this.withBackArrow = false,
  });
  final Widget body;
  final Widget? bottomNavigationBar;
  final String? appBarTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool withBackArrow;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageAssets.bgImagePng,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              shadowColor: Colors.transparent,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(appBarTitle ?? "")],
              ),
              actions:
                  withBackArrow
                      ? [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: REdgeInsets.only(top: 10.0),
                            child: SvgPicture.asset(
                              ImageAssets.arrowBack,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ]
                      : actions,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ],
    );
  }
}
