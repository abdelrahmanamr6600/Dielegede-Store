import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.validation,
    required this.controller,
    this.suffixFun,
    this.suffix,
    this.isPassword = false,
    this.labelText,
    this.hintText,
    this.onSubmit,
    required this.inputType,
    this.enabled = true,
    this.disabledTextColor,
    this.enabledTextColor,
    this.onChange,
  });

  final String? hintText;
  final bool isPassword;
  final Widget? icon;
  final String? Function(String?)? validation;
  final TextEditingController controller;
  final Function? suffixFun;
  final IconData? suffix;
  final String? labelText;
  final Function? onSubmit;
  final Function? onChange;
  final TextInputType inputType;
  final bool enabled;
  final Color? disabledTextColor;
  final Color? enabledTextColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChange?.call(value);
      },
      enabled: enabled,
      keyboardType: inputType,
      style: TextStyle(
        color: enabled
            ? enabledTextColor ?? darkColor
            : disabledTextColor ?? Colors.grey,
        fontSize: 14.sp,
      ),
      onFieldSubmitted: (value) {
        onSubmit?.call(value);
      },
      obscureText: isPassword,
      controller: controller,
      cursorColor: mainColor,
      cursorErrorColor: mainColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: strokColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: strokColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: strokColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: strokColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorStyle: TextStyle(
          color: errorColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
          suffixIcon: IconButton(
            splashColor: Colors.transparent, 
            highlightColor: Colors.transparent, 
            hoverColor: Colors.transparent, 
            onPressed: () {
              suffixFun?.call();
            },
            icon: Icon(suffix,  color:const Color(0xFFACB5BB)),
          ),
      ),
      validator: validation,
    );
  }
}
