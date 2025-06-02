import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeSelectionWidget extends StatelessWidget {
  final List<String> sizes;
  final List<String> selectedSizes;
  final ValueChanged<String> onSizeSelected;

  const SizeSelectionWidget({
    Key? key,
    required this.sizes,
    required this.selectedSizes,
    required this.onSizeSelected,
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
            "Sizes",
            style: AppTextStyles.largeText()
                .copyWith(color: darkColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: sizes.map((size) {
                bool isSelected = selectedSizes.contains(size);
                return GestureDetector(
                  onTap: () => onSizeSelected(size),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: isSelected ? mainColor : Colors.white,
                      border: Border.all(color: borderColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      size,
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
        ),
      ],
    );
  }
}
