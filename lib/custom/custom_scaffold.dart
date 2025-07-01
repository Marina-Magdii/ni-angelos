import 'package:flutter/material.dart';
import 'package:ni_angelos/core/image_assets.dart';

class MyCustomScaffold extends StatelessWidget {
   MyCustomScaffold({super.key,required this.child,this.bottomNavigationBar});
Widget child;
Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Stack(children:[
      Image.asset(ImageAssets.bgImagePng,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,),
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:child ,
          bottomNavigationBar: bottomNavigationBar,
        ),
      )]);
  }
}
