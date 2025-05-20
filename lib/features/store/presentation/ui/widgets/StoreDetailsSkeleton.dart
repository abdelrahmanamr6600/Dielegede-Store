import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreDetailsLoadingSkeleton extends StatelessWidget {
  const StoreDetailsLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeletonizer(
                enabled: true,
                child: Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r)),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeletonizer(
                      enabled: true,
                      child: Container(
                        height: 26.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Skeletonizer(
                      enabled: true,
                      child: Container(
                        height: 26.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Text("Products",
                        style: AppTextStyles.largeText()
                            .copyWith(color: blackColor, fontSize: 20.sp)),
                    SizedBox(height: 35.h),
                    SizedBox(
                      height: 110.h,
                      child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (_, __) => SizedBox(width: 10.w),
                        itemBuilder: (context, index) {
                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              height: 110.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              // margin: EdgeInsets.only(right: 8.w),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Row(
                      children: [
                        Expanded(
                          child: Skeletonizer(
                            enabled: true,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              height: 45.h,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Skeletonizer(
                          enabled: true,
                          child: Container(
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
