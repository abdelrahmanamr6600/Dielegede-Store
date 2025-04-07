import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BagProductItem extends StatelessWidget {
  final bool timeEnded;
  const BagProductItem({super.key, required this.timeEnded});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    "assets/images/hoody.png",
                    width: 105.w,
                    height: 105.h,
                    fit: BoxFit.fitHeight,
                    color: timeEnded ? Colors.white.withOpacity(0.5) : null,
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LIME",
                        style: AppTextStyles.mainText().copyWith(
                          fontSize: 12.sp,
                          color: greyColor.withOpacity(timeEnded ? 0.5 : 1),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Shirt",
                        style: AppTextStyles.mainText().copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFF222222)
                              .withOpacity(timeEnded ? 0.5 : 1),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            "Color: ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(timeEnded ? 0.5 : 1),
                            ),
                          ),
                          Text(
                            "Blue",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF222222)
                                  .withOpacity(timeEnded ? 0.5 : 1),
                            ),
                          ),
                          SizedBox(width: 18.w),
                          Text(
                            "Size: ",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(timeEnded ? 0.5 : 1),
                            ),
                          ),
                          Text(
                            "L",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF222222)
                                  .withOpacity(timeEnded ? 0.5 : 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "32\$",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color:
                                  Colors.black.withOpacity(timeEnded ? 0.5 : 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.amber
                                        .withOpacity(timeEnded ? 0.5 : 1),
                                    size: 14.w),
                                Icon(Icons.star,
                                    color: Colors.amber
                                        .withOpacity(timeEnded ? 0.5 : 1),
                                    size: 14.sp),
                                Icon(Icons.star,
                                    color: Colors.amber
                                        .withOpacity(timeEnded ? 0.5 : 1),
                                    size: 14.sp),
                                Icon(Icons.star,
                                    color: Colors.amber
                                        .withOpacity(timeEnded ? 0.5 : 1),
                                    size: 14.sp),
                                Icon(Icons.star,
                                    color: Colors.amber
                                        .withOpacity(timeEnded ? 0.5 : 1),
                                    size: 14.sp),
                                SizedBox(width: 4.w),
                                Text(
                                  '(10)',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey
                                        .withOpacity(timeEnded ? 0.5 : 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.close,
                        color: greyColor.withOpacity(0.6), size: 20.sp),
                    const Spacer(),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(AssetsData.timer),
                          Text(
                            "24h",
                            style: AppTextStyles.mainText().copyWith(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (timeEnded)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
      ],
    );
  }
}
