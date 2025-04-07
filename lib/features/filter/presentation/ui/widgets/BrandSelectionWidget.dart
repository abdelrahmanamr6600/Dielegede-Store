import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandSelectionWidget extends StatelessWidget {
  final String title;
  final String brands;
  final VoidCallback onTap;

  const BrandSelectionWidget({
    Key? key,
    required this.title,
    required this.brands,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      width: double.infinity,
      color: const Color(0xFFF9F9F9),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Brand",
                  style: AppTextStyles.largeText
                      ().copyWith(color: darkColor, fontWeight: FontWeight.w600),
                ),
                Text(
                  "adidas Originals, Jack & Jones, s.Oliver",
                  style: AppTextStyles.smallText
                      ().copyWith(color: greyColor, fontSize: 11.sp),
                ),
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(AssetsData.arrowRight)
        ],
      ),
    );
  }
}
