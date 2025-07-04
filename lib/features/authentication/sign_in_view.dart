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
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showFields = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // app logo
          TweenAnimationBuilder<Offset>(
            tween: Tween(begin: Offset(0, 0), end: Offset(0, -50)),
            duration: Duration(seconds: 1),
            builder: (context, offset, child) {
              return Transform.translate(offset: offset, child: child);
            },
            child: SvgPicture.asset(ImageAssets.logoIcon),
          ),

          // delay to show text fields
          AnimatedOpacity(
            opacity: _showFields ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: IgnorePointer(
              ignoring: !_showFields,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // id text field
                      CustomTextField(
                        hintText: StringsManager.id,
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

                      // password text field
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
                      ).animate().slideX(
                        duration: const Duration(seconds: 1),
                      ),

                      // sign in button
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
                                padding: REdgeInsets.all(8.0),
                                child: Text(
                                  StringsManager.signIn,
                                  style:
                                      Theme.of(context).textTheme.bodySmall,
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
            ),
          ),
        ],
      ),
    );
  }

  onSignIn() {
    // check validation before sign in
    if (formKey.currentState?.validate() ?? false) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesManager.main,
        (route) => false,
      );
    }
  }
}
