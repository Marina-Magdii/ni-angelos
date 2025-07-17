import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ni_angelos/core/color_manager.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({
    super.key,
    required this.hintText,
    required this.validator,
     required this.obscure,
    required this.controller,
    required this.isPass,
  });
  final String hintText;
   bool obscure = false;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPass;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          boxShadow:  ColorManager.shadow
        ),
        child: TextFormField(
          textDirection: TextDirection.rtl,
          controller: widget.controller,
          obscureText: widget.obscure,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: widget.isPass
                ?Icon(Icons.lock,color: ColorManager.primaryColor,)
            :Icon(Icons.person_rounded,color: ColorManager.primaryColor,),
            prefixIcon:
                widget.isPass
                    ? IconButton(
                      onPressed: () {
                        widget.obscure = !widget.obscure;
                        setState(() {});
                      },
                      icon:
                          widget.obscure
                              ? Icon(Icons.visibility_off,color: ColorManager.primaryColor,)
                              : Icon(Icons.visibility,color: ColorManager.primaryColor,),
                    )
                    : null,
            hintText: widget.hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(
              color: ColorManager.secondaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
            filled: true,
            fillColor: ColorManager.containerColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: BorderSide(color: Colors.transparent, width: 2.w),
            ),
          ),
        ),
      ),
    );
  }
}
