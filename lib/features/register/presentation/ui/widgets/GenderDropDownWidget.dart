 import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildGenderDropdown( String selectedGender ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: strokColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: strokColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: strokColor),
        ),
      ),
      dropdownColor: Colors.white,
      value: selectedGender,
      items: ["male", "female"].map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(
            gender,
            style: AppTextStyles.mainText().copyWith(color: darkColor),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          selectedGender = newValue;
        }
      },
    );
  }