import 'dart:async';

import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/search/presentation/cubit/SearchCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  final Color? color;
  const SearchWidget({
    super.key,
    this.color,
  });
  
  @override
  Widget build(BuildContext context) {
    Timer? debounce;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: color ?? const Color(0xFFF0F2F1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextField(
          cursorColor: mainColor,
          onChanged: (query) {
            if (debounce?.isActive ?? false) debounce!.cancel();
            debounce = Timer(const Duration(milliseconds: 300), () {
              context.read<SearchCubit>().searchProducts(query);
            });
          },
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
