import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingSelectionWidget extends StatelessWidget {
  final int selectedRating;
  final ValueChanged<int> onRatingSelected;

  const RatingSelectionWidget({
    Key? key,
    required this.selectedRating,
    required this.onRatingSelected,
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
            "Rating",
            style: AppTextStyles.largeText
                .copyWith(color: darkColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 20.h),
        Column(
          children: List.generate(5, (index) {
            int ratingValue = 5 - index;
            return ListTile(
              leading: Radio(
                activeColor: mainColor,
                fillColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? mainColor
                      : darkGreyColor,
                ),
                value: ratingValue,
                groupValue: selectedRating,
                onChanged: (value) => onRatingSelected(value as int),
              ),
              title: Row(
                children: List.generate(5, (starIndex) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: SvgPicture.asset(
                      starIndex < ratingValue
                          ? AssetsData.rate
                          : AssetsData.rateOutLined,
                      width: 22.w,
                      height: 21.h,
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ],
    );
  }
}
