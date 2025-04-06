import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButtonWidget extends StatelessWidget {
  final VoidCallback onSkip;

  const SkipButtonWidget({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.h,
      right: 16.w,
      child: GestureDetector(
        onTap: onSkip,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: darkColor),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            "Skip",
            style: TextStyle(
              color: darkColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
