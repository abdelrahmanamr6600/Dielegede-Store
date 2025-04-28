import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryState.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/HomeCategoryItemSkeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const HomeCategoryItemSkeleton();
              } else if (state is CategorySuccess) {
                final categoryList = state.response.data.categories;
                final homeCategories = categoryList.length > 3 ? categoryList.sublist(0, 3) : categoryList;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...homeCategories.map((category) {
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
                                          "assets/images/kids.png",
                                          fit: BoxFit.cover,
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    category.name,
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
                );
              }
              return const Center(
                child: Text("Error loading categories"),
              );
            },
          ),
        ],
      ),
    );
  }
}
