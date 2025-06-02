import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelectionWidget extends StatelessWidget {
  final List<Color> colors;
  final List<Color> selectedColors;
  final ValueChanged<Color> onColorSelected;

  const ColorSelectionWidget({
    Key? key,
    required this.colors,
    required this.selectedColors,
    required this.onColorSelected,
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
            "Colors",
            style: AppTextStyles.largeText()
                .copyWith(color: darkColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: colors.map((color) {
              bool isSelected = selectedColors.contains(color);
              return GestureDetector(
                onTap: () => onColorSelected(color),
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? mainColor : Colors.white,
                    border: isSelected
                        ? Border.all(color: mainColor, width: 1.5)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: CircleAvatar(radius: 14.w, backgroundColor: color),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
