import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final bool showButton;

  const ProductItem({super.key, required this.product, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/productDetailsScreen' , extra: product);
      },
      child: Container(
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
                            'assets/images/category_w.png',
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
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
                              "\$${product.price}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
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
                      Expanded(
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyles.smallText().copyWith(
                              color: const Color(0xFF393F42), fontSize: 14.sp),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(AssetsData.rate,
                      //         width: 10.w, height: 8.h),
                      //     SizedBox(width: 5.w),
                      //     Text(
                      //       product.category.,
                      //       style: AppTextStyles.smallText().copyWith(
                      //           color: Colors.black,
                      //           fontSize: 8.sp,
                      //           fontWeight: FontWeight.w700),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    product.category.name,
                    style: AppTextStyles.smallText()
                        .copyWith(fontSize: 8.sp, color: greyColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  if (showButton) ...[
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
      ),
    );
  }
}
