import 'package:dielegende_store/core/shared/fun/getLocation.dart';
import 'package:dielegende_store/core/shared/fun/handleAuthActionRequired.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/ProductSearch.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.currentAddress});
  final String? currentAddress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery address",
                            style: AppTextStyles.smallText().copyWith(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFC8C8CB),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                currentAddress ?? '',
                                style: AppTextStyles.smallText().copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF393F42),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  goToNearbyStores(context);
                                },
                                child:
                                    Icon(Icons.keyboard_arrow_down, size: 14.w),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          InkWell(
                            onTap: () {
                              goToNearbyStores(context);
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: strokColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_on,
                                      size: 16.sp,
                                      color: const Color(0xFFD65B5B)),
                                  SizedBox(width: 4.w),
                                  Text("nearby stores",
                                      style: AppTextStyles.smallText().copyWith(
                                          color: const Color(0xFF393F42),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF393F42),
                              width: 1.5.w,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              await handleAuthRequiredAsyncAction(context,
                                  () async {
                                context.push('/FollowedStoresScreen');
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SvgPicture.asset(
                                "assets/icons/add.svg",
                                width: 15.w,
                                height: 15.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.push('/notificationScreen');
                              },
                              child: SvgPicture.asset(
                                AssetsData.notification,
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                            Positioned(
                              top: -2.h,
                              right: -2.w,
                              child: Container(
                                padding: EdgeInsets.all(3.r),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD65B5B),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              const ProductSearch(),
            ],
          ),
        ),
      ),
    );
  }
}
