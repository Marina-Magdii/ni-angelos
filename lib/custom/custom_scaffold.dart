import 'package:flutter/material.dart';
import 'package:ni_angelos/core/image_assets.dart';

class MyCustomScaffold extends StatelessWidget {
  const MyCustomScaffold({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.appBarTitle,
    this.actions,
  });
  final Widget child;
  final Widget? bottomNavigationBar;
  final String? appBarTitle;
  final List<Widget>? actions;
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
          context: context,
          removeTop: true,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: child,
              bottomNavigationBar: bottomNavigationBar,
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
            ),
          ),
        ),
      ],
    );
  }
}
