import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CategoryItem({
  required String image,
  String? text,
  Alignment alignment = Alignment.center,
  Color textColor = Colors.white,
  Color? backgroundColor,
}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    child: Stack(children: [
      if (backgroundColor != null)
        Container(
          color: backgroundColor.withOpacity(0.8),
        ),
      Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Text(
            text ?? "",
            style: AppTextStyles.largeText.copyWith(
                fontSize: 34.sp, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
      )
    ]),
  );
}
