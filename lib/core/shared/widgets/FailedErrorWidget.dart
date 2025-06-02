import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FailedLoadingData extends StatelessWidget {
  const FailedLoadingData({
    super.key,
    required this.text,
    required this.fun,
  });
  final String text;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Lottie.asset('assets/images/search_lotti.json', height: 50.h),
          Text(
            text,
            style:
                AppTextStyles.smallText().copyWith(color: Colors.grey.shade600),
          ),
          TextButton(
            onPressed: () {
              fun();
            },
            child: Text(
              "Retry",
              style: AppTextStyles.mainText().copyWith(color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
