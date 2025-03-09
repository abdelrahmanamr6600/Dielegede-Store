import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int currentPage;
  final int totalPages;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250.h),
          SizedBox(height: 24.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: darkColor,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: darkColor,
                fontWeight: FontWeight.w300,
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (index) => buildDot(index)),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 4.h,
      width: currentPage == index ? 24.w : 24.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: currentPage == index ? mainColor : Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
