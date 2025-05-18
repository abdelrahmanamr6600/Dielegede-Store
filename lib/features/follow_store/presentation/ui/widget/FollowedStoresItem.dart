import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/features/follow_store/data/FollowStoreRepo.dart';
import 'package:dielegende_store/features/follow_store/data/FollowedStoresModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowedStoresItemWidget extends StatelessWidget {
  const FollowedStoresItemWidget({
    super.key,
    required this.stores,
    required this.images,
  });

  final List<Store> stores;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.5,
            ),
            itemCount: stores.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = stores[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          images[index],
                          width: 160.w,
                          height: 150.h,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        item.name,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.mainText().copyWith(
                          color: const Color(0xFF000000),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
