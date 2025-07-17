import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ni_angelos/core/color_manager.dart';
import 'package:ni_angelos/core/image_assets.dart';
import 'package:ni_angelos/core/routes_manager.dart';
import 'package:ni_angelos/core/strings_manager.dart';
import 'package:ni_angelos/custom/custom_divider.dart';
import 'package:ni_angelos/custom/custom_scaffold.dart';
import 'package:ni_angelos/custom/custom_textfield.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  late bool maxLines= false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringsManager.policyEng,maxLines: maxLines?200:9,overflow: TextOverflow.ellipsis,),
              CustomDivider(),
              Text(StringsManager.policyArab,textDirection: TextDirection.rtl,maxLines: maxLines?200:8,
              overflow: TextOverflow.ellipsis,),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(onPressed: (){
                  setState(() {
                    maxLines=!maxLines;
                  });
                }, child: Text(maxLines
                    ?"Less"
                    :"More"
                  ,style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 16.sp,
                  fontFamily: StringsManager.fontFamily,
                  decoration: TextDecoration.underline
                ),)),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: (){
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesManager.main,
                        (route) => false,
                      );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: ColorManager.secondaryColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("المتابعة",
                    style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                ),
              )
              // // app logo
              // TweenAnimationBuilder<Offset>(
              //   tween: Tween(begin: Offset(0, 0), end: Offset(0, -50)),
              //   duration: Duration(seconds: 1),
              //   builder: (context, offset, child) {
              //     return Transform.translate(offset: offset, child: child);
              //   },
              //   child: SvgPicture.asset(ImageAssets.logoIcon),
              // ),
              //
              // // delay to show text fields
              //  Center(
              //     child: Form(
              //       key: formKey,
              //       child: Column(
              //         children: [
              //           // id text field
              //           CustomTextField(
              //             hintText: StringsManager.id,
              //             validator: (value) {
              //               if (value == null || value.isEmpty) {
              //                 return StringsManager.enterName;
              //               }
              //               return null;
              //             },
              //             obscure: false,
              //             controller: codeController,
              //             isPass: false,
              //           ).animate().slideX(
              //             duration: const Duration(seconds: 1),
              //             begin: 1.0,
              //             end: 0,
              //           ),
              //
              //           // password text field
              //           CustomTextField(
              //             hintText: StringsManager.pass,
              //             validator: (value) {
              //               if (value == null || value.isEmpty) {
              //                 return StringsManager.enterPass;
              //               }
              //               return null;
              //             },
              //             obscure: true,
              //             controller: passController,
              //             isPass: true,
              //           ).animate().slideX(
              //             duration: const Duration(seconds: 1),
              //           ),
              //
              //           // sign in button
              //           SizedBox(height: 20.h),
              //           InkWell(
              //             onTap: onSignIn,
              //             child: Container(
              //               width: MediaQuery.of(context).size.width * 0.8,
              //               decoration: BoxDecoration(
              //                 color: ColorManager.primaryColor,
              //                 borderRadius: BorderRadius.circular(32.r),
              //                 boxShadow: ColorManager.shadow,
              //               ),
              //               child: Padding(
              //                 padding: REdgeInsets.symmetric(
              //                   vertical: 8.0,
              //                   horizontal: 16,
              //                 ),
              //                 child: Center(
              //                   child: Padding(
              //                     padding: REdgeInsets.all(8.0),
              //                     child: Text(
              //                       StringsManager.signIn,
              //                       style:
              //                           Theme.of(context).textTheme.bodySmall,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ).animate().fade(duration: Duration(seconds: 3)),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  // onSignIn() {
  //   // check validation before sign in
  //   if (formKey.currentState?.validate() ?? false) {
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       RoutesManager.main,
  //       (route) => false,
  //     );
  //   }
  // }
}
