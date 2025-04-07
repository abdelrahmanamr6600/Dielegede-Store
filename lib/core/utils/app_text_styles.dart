import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart'; // Import your colors file if needed

class AppTextStyles {
  static TextStyle mainText() {
    return GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  static TextStyle smallText() {
    return GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle largeText() {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle getTextStyle(
      {Color? color = Colors.white,
      double fontSize = 16.0,
      FontWeight fontWeight = FontWeight.w700}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
