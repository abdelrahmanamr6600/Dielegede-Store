   import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

buildPhoneNumberField(TextEditingController phoneController) {
    return IntlPhoneField(
      cursorColor: mainColor,
      decoration: InputDecoration(
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
    );
  }