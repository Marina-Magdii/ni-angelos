import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_textfield.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool _showFields = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showFields = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.logoIcon)
                .animate(
                  onPlay: (controller) => controller, // avoid re-triggering
                )
                .move(
                  duration: Duration(seconds: 3),
                  begin: Offset(0, 0),
                  end: Offset(0, -100),
                  delay: 2.seconds,
                  curve: Curves.easeOut, // Moves up
                ),
            if (_showFields) ...[
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: StringsManager.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringsManager.enterName;
                          }
                          return null;
                        },
                        obscure: false,
                        controller: TextEditingController(),
                        isPass: false,
                      ).animate().slideX(
                        duration: const Duration(seconds: 1),
                        begin: 1.0,
                        end: 0,
                      ),
                      CustomTextField(
                        hintText: StringsManager.pass,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringsManager.enterPass;
                          }
                          return null;
                        },
                        obscure: true,
                        controller: TextEditingController(),
                        isPass: true,
                      ).animate().slideX(duration: const Duration(seconds: 1)),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: onSignIn,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: ColorManager.shadow,
                          ),
                          child: Padding(
                            padding: REdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  StringsManager.signIn,
                                  style: TextStyle(color: ColorManager.bgColor),
                                ),
                              ),
                            ),
                          ),
                        ).animate().fade(duration: Duration(seconds: 3)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  onSignIn() {
    if (formKey.currentState?.validate() ?? false) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.main,
        (route) => false,
      );
    }
  }
}
