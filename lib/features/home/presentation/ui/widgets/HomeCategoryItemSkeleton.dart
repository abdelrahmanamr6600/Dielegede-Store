import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategoryItemSkeleton extends StatelessWidget {
  const HomeCategoryItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          width: 28.w,
        ),
        itemBuilder: (context, index) {
          return Skeletonizer(
            child: Column(
              children: [
                Container(
                  width: 46.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25.r)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 40.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
