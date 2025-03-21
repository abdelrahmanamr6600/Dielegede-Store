import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductItem extends StatelessWidget {
  final Map<String, dynamic> product;
  final bool showButton;

  const ProductItem({super.key, required this.product, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          product["image"],
                          width: double.infinity,
                          height: 130.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 15.h,
                        left: 10.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            "\$${product["price"]}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AssetsData.inactiveHeart),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product["title"],
                      style: AppTextStyles.smallText.copyWith(
                          color: const Color(0xFF393F42), fontSize: 14.sp),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AssetsData.rate,
                            width: 10.w, height: 8.h),
                        SizedBox(width: 5.w),
                        Text(
                          product["rating"].toString(),
                          style: AppTextStyles.smallText.copyWith(
                              color: Colors.black,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  product["desc"],
                  style: AppTextStyles.smallText
                      .copyWith(fontSize: 8.sp, color: greyColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                if(showButton)...[
                CustomButton(
                  onPressed: () {},
                  text: "Book in bag",
                  height: 30.h,
                  color: mainColor,
                ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
