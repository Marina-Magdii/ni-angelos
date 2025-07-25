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
    this.leadingWidth,
  });
  final Widget body;
  final Widget? bottomNavigationBar;
  final String? appBarTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool withBackArrow;
  final double? leadingWidth;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            ImageAssets.bgImagePng,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            appBar:
                appBarTitle != null
                    ? AppBar(
                      leadingWidth: leading != null ? leadingWidth??90.w : 10.w,
                      leading:
                          leading != null
                              ? Padding(
                                padding: REdgeInsets.only(left: 8.0),
                                child: Container(
                                  padding: REdgeInsets.only(top: 4),
                                  child: leading,
                                ),
                              )
                              : null,
                      scrolledUnderElevation: 0,
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      title: Align(
                        alignment: Alignment.centerRight,
                        child: Text(appBarTitle ?? ""),
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
                    )
                    : null,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ],
      ),
    );
  }
}
