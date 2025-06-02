import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dielegende_store/core/utils/colors.dart';

void showCustomSnackBar(
  BuildContext context,
  String message,
  {
  IconData icon = Icons.error_outline,
  Color backgroundColor = errorColor,
  double? fontSize ,

}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 12.w),
            Flexible(
              child: Text(
                message,
                style: AppTextStyles.smallText().copyWith(
                  color: Colors.white,
                  fontSize: fontSize ?? 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
