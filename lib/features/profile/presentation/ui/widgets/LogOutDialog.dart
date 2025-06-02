import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutDialog extends StatelessWidget {
  final VoidCallback action;
  final String headerMessage;
  final String bodyMessage;
  final String buttonText;

  const LogOutDialog({
    super.key,
    required this.action,
    required this.headerMessage,
    required this.bodyMessage,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 50.sp),
            SizedBox(height: 15.h),
            Text(
              headerMessage,
              style: AppTextStyles.largeText().copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              bodyMessage,
              style: AppTextStyles.smallText().copyWith(
                color: Colors.grey.shade600,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: AppTextStyles.mainText().copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    
                      action();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(buttonText, style: AppTextStyles.mainText()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
