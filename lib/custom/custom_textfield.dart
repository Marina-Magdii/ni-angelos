import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({
    super.key,
    required this.hintText,
    required this.validator,
    this.obscure = false,
    required this.controller,
    this.isPass = false,
     this.withIcon =false,
     this.borderRadius,
  });
  final String hintText;
  bool obscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
   bool isPass;
  final bool withIcon;
  final BorderRadius? borderRadius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(32.r),
          boxShadow: ColorManager.shadow,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscure,
            validator: widget.validator,
            decoration: InputDecoration(
              prefixIcon: widget.withIcon?
                  widget.isPass
                      ? Icon(Icons.lock, color: ColorManager.primaryColor)
                      : Icon(
                        Icons.person_rounded,
                        color: ColorManager.secondaryColor,
                      )
              :null,
              suffixIcon:
                  widget.isPass
                      ? Padding(
                        padding: REdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.obscure = !widget.obscure;
                            });
                          },
                          icon:
                              widget.obscure
                                  ? Icon(
                                    Icons.visibility_off,
                                    color: ColorManager.primaryColor,
                                  )
                                  : Icon(
                                    Icons.visibility,
                                    color: ColorManager.primaryColor,
                                  ),
                        ),
                      )
                      : null,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall,
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius??BorderRadius.circular(32.r),
                borderSide: BorderSide(color: Colors.transparent, width: 2.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius??BorderRadius.circular(32.r),
                borderSide: BorderSide(color: Colors.transparent, width: 2.w),
              ),
              filled: true,
              fillColor: ColorManager.containerColor,
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius??BorderRadius.circular(32.r),
                borderSide: BorderSide(color: Colors.transparent, width: 2.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
