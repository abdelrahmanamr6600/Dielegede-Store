import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItem.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});

  @override
  Widget build(Object context) {
    final List<Map<String, dynamic>> products = [
      {
        "image": "assets/images/hoody.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "desc":
            "It is a long established fact that a reader will be distracted...",
        "rating": 4.9,
      },
      {
        "image": "assets/images/t-shirt.png",
        "title": "Black T-shirt",
        "price": "109.99",
        "desc":
            "It is a long established fact that a reader will be distracted by the readable content of a page w...",
        "rating": 4.7,
      },
      {
        "image": "assets/images/hoody.png",
        "title": "Cream Hoodie",
        "price": "199.99",
        "desc":
            "It is a long established fact that a reader will be distracted...",
        "rating": 4.9,
      },
      {
        "image": "assets/images/t-shirt.png",
        "title": "Black T-shirt",
        "price": "109.99",
        "desc":
            "It is a long established fact that a reader will be distracted by the readable content of a page w...",
        "rating": 4.7,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Products",
                style: AppTextStyles.mainText.copyWith(
                    color: const Color(0xFF393F42),
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "Filters",
                    style: AppTextStyles.smallText.copyWith(
                      color: const Color(0xFF393F42),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SvgPicture.asset(
                    AssetsData.filter,
                    width: 12.w,
                    height: 12.h,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductItem(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
