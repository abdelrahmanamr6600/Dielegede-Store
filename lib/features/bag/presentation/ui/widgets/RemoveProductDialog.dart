import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveProductDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const RemoveProductDialog({super.key, required this.onDelete});

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
              "Remove Product?",
              style: AppTextStyles.largeText().copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              "Are you sure you want to remove this product from your bag?",
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
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      onDelete();
                    },
                    child: Text(
                      "Remove",
                      style: AppTextStyles.mainText(),
                    ),
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
