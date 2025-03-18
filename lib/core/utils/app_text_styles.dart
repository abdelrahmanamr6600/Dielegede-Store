import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart'; // Import your colors file if needed

class AppTextStyles {
  static TextStyle mainText = 
     TextStyle(
      fontSize: 14.sp,
      fontWeight:  FontWeight.w500,
      fontFamily: GoogleFonts.inter().fontFamily,
      color: Colors.white,
    );

  static TextStyle smallText =  TextStyle(
      fontSize: 12.sp,
      fontWeight:FontWeight.w400,
      fontFamily: GoogleFonts.inter().fontFamily,
      color: Colors.white,
    );
  

  static TextStyle largeText = TextStyle(
      fontSize: 16.sp,
      fontWeight:   FontWeight.w700,
      fontFamily: GoogleFonts.inter().fontFamily,
      color: Colors.white,
    );
  
}

