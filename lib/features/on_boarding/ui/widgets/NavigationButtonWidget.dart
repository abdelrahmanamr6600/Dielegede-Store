import 'dart:ui';

import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationButtonsWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const NavigationButtonsWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      left: 16.w,
      right: 16.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            ElevatedButton(
              onPressed: onPrevious,
              style: ElevatedButton.styleFrom(
                foregroundColor: mainColor,
                backgroundColor: Colors.white,
                elevation: 0,
                side: const BorderSide(color: mainColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
              child: Text(
                "Back",
                style: AppTextStyles.mainText.copyWith(
                    color: mainColor, fontWeight: FontWeight.w400),
              ),
            )
          else
            SizedBox(width: 60.w),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
            child: Text(
              currentPage == totalPages - 1 ? "Get Started" : "Next",
              style: AppTextStyles.mainText.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
