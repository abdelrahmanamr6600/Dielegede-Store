import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileLisTile extends StatelessWidget {
  const ProfileLisTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: AppTextStyles.getTextStyle().copyWith(color: Colors.black),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: MediaQuery.textScalerOf(context).scale(16),
            color: const Color(0xFF9B9B9B),
          ),
          onTap: () {
            onTap();
          },
        ),
        Align(
          alignment: Alignment.center,
          child: Divider(
            height: 1.sp,
            thickness: 0.8,
            color: Colors.grey.shade300,
          ),
        )
      ],
    );
  }
}