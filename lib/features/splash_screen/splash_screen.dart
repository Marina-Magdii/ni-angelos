import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/features/authentication/sign_in_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>SignInView(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
      ));
    });
    return MyCustomScaffold(
        child: Center(
          child: SvgPicture.asset(ImageAssets.logoIcon),
        ).animate().fadeIn(duration: const Duration(seconds: 4)),)
        ;
  }
}
