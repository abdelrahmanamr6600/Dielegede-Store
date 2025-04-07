import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CategorySection extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": "assets/images/popular.png", "title": "Popular"},
    {"icon": "assets/images/men.png", "title": "Men"},
    {"icon": "assets/images/women.png", "title": "Women"},
    {"icon": "assets/images/kids.png", "title": "Kids"},
  ];

  CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: AppTextStyles.mainText().copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF393F42),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...categories.map((category) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w, left: 5.w),
                    child: Column(
                      children: [
                        Container(
                          width: 46.w,
                          height: 46.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDFAFF),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipOval(
                              child: Image.asset(
                                category["icon"],
                                fit: BoxFit.cover,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          category["title"],
                          style: AppTextStyles.smallText().copyWith(
                            color: const Color(0xFF939393),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    context.push('/categoryScreen');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Column(
                      children: [
                        Container(
                          width: 46.w,
                          height: 46.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDFAFF),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              fit: BoxFit.contain,
                              'assets/icons/category.svg',
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "All",
                          style: AppTextStyles.smallText().copyWith(
                            color: const Color(0xFF939393),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
