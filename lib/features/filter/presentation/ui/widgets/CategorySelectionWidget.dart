import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySelectionWidget extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategorySelectionWidget({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          color: const Color(0xFFF9F9F9),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Category",
            style: AppTextStyles.largeText
                ().copyWith(color: darkColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: categories.map((category) {
              bool isSelected = selectedCategory == category;
              return GestureDetector(
                onTap: () => onCategorySelected(category),
                child: Container(
                  width: 100.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? mainColor : Colors.white,
                    border: Border.all(color: borderColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    category,
                    style: AppTextStyles.mainText().copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
