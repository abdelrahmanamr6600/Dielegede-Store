import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRangeWidget extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final ValueChanged<RangeValues> onPriceChanged;

  const PriceRangeWidget({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.onPriceChanged,

  });

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
            "Price Range",
             style: AppTextStyles.largeText.copyWith(
                        color: darkColor, fontWeight: FontWeight.w600),
                  ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${minPrice.toInt()}",
                            style: AppTextStyles.mainText
                                .copyWith(color: darkColor)),
                        Text("\$${maxPrice.toInt()}",
                            style: AppTextStyles.mainText
                                .copyWith(color: darkColor)),
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: mainColor,
            activeTickMarkColor: mainColor,
            inactiveTrackColor: greyColor.withOpacity(0.6),
            thumbColor: mainColor,
            overlayColor: mainColor.withOpacity(0.2),
            trackHeight: 4.h,
          ),
          child: RangeSlider(
            values: RangeValues(minPrice, maxPrice),
            min: 0,
            max: 200,
            onChanged: onPriceChanged,
          ),
        ),
      ],
    );
  }
}
