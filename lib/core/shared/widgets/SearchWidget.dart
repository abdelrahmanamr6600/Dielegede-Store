import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Color(0xFFF0F2F1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextField(
          cursorColor: mainColor,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.r),
              child: SvgPicture.asset(
                AssetsData.search,
                width: 20.w,
                height: 20.h,
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
            ),
            hintText: "Search here ...",
            hintStyle: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFFC8C8CB),
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w400),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          ),
        ),
      ),
    );
  }
}
