import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget buildPhoneNumberField(
    BuildContext context, TextEditingController phoneController) {
  return Theme(
    data: Theme.of(context).copyWith(
      dialogBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: blackColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: greyColor),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: mainColor,
      ),
    ),
    child: IntlPhoneField(
      disableLengthCheck: true,
      cursorColor: mainColor,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        errorStyle: TextStyle(color: errorColor, fontSize: 12.sp),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: strokColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: strokColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: strokColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: strokColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: strokColor)),
      ),
      initialCountryCode: 'SA',
      onChanged: (phone) {
        phoneController.text = phone.completeNumber;
      },
      validator: (value) {
        if (value == null || value.number.trim().isEmpty) {
          return 'Phone number is required';
        } else if (value.number.length < 9) {
          return 'Invalid phone number';
        }
        return null;
      },
    ),
  );
}
