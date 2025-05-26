
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BagLoadingWidget extends StatelessWidget {
  final TabController tabController;

  const BagLoadingWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              _buildSkeletonList(),
              _buildSkeletonList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      itemBuilder: (context, index) => const BagProductItemSkeleton(),
    );
  }
}

class BagProductItemSkeleton extends StatelessWidget {
  const BagProductItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  width: 105.w,
                  height: 105.h,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 14.h, width: 100.w, color: Colors.grey),
                    SizedBox(height: 4.h),
                    Container(height: 18.h, width: 80.w, color: Colors.grey),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Container(
                            height: 12.h, width: 50.w, color: Colors.grey),
                        SizedBox(width: 10.w),
                        Container(
                            height: 12.h, width: 40.w, color: Colors.grey),
                        SizedBox(width: 18.w),
                        Container(
                            height: 12.h, width: 40.w, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 14.h, width: 60.w, color: Colors.grey),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Icon(Icons.star,
                                  size: 14.sp, color: Colors.grey[400]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(Icons.close, color: Colors.grey.withOpacity(0.6)),
                  const Spacer(),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 14.h, width: 14.w, color: Colors.grey),
                        SizedBox(height: 4.h),
                        Container(
                            height: 10.h, width: 20.w, color: Colors.grey),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
