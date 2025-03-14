import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart'; // Import your colors file if needed

class AppTextStyles {
  static TextStyle headline = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: darkColor,
  );

  static TextStyle subHeadline = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: greyColor,
  );

  static TextStyle bodyText = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14.sp,
    color: darkColor,
  );

  static TextStyle caption = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 12.sp,
    color: Colors.grey,
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle inputFieldText = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 12.sp,
    color: Colors.black,
  );
}
