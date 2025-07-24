import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/features/authentication/sign_in_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) =>SignInView(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      body: Center(
        child: SvgPicture.asset(ImageAssets.logoIcon),
      ).animate().scale(
        begin: Offset(0.1, 0.1), // Start small
        end: Offset(1, 1), // End at full size
        duration: 3.seconds,
        curve: Curves.easeOut,
      ),
    );
  }
}
