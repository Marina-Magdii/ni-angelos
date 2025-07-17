import 'package:flutter/material.dart';
import 'package:ni_angelos/core/image_assets.dart';

class MyCustomScaffold extends StatelessWidget {
  const MyCustomScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBarTitle,
    this.actions,
    this.leading
  });
  final Widget body;
  final Widget? bottomNavigationBar;
  final String? appBarTitle;
  final List<Widget>? actions;
  final Widget? leading;
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
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    appBarTitle ?? "",
                  ),
                ],
              ),
              actions: actions,
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
