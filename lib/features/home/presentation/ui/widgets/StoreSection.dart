import 'package:dielegende_store/core/shared/widgets/FailedErrorWidget.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';

import 'package:dielegende_store/features/home/presentation/ui/widgets/HomeCategoryItemSkeleton.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class StoreSection extends StatelessWidget {
  const StoreSection({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> storeImages = [
      "assets/images/store1.png",
      "assets/images/store2.png",
      "assets/images/store3.png",
      "assets/images/store1.png"
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Store",
                style: AppTextStyles.mainText().copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF393F42)),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.push(
                    "/AllStoresScreen",
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 12.sp,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: mainColor,
                    decorationThickness: 1.5.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          BlocConsumer<StoreProductsCubit, StoreProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AllStoreLoadingState) {
                return const HomeCategoryItemSkeleton();
              } else if (state is AllStoreErrorState) {
                return FailedLoadingData(
                  text: 'failed to load stores',
                  fun: () {
                    context.read<StoreProductsCubit>().getAllStores();
                  },
                );
              } else if (state is AllStoreSuccessState) {
                final storeList = state.products.data.stores;
                final storeCategories =
                    storeList.length > 3 ? storeList.sublist(0, 4) : storeList;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...storeCategories.map((category) {
                            return GestureDetector(
                              onTap: () {
                                context.push(
                                  "/StoreDetailsScreen",
                                  extra: category.id,
                                );
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: 20.w, left: 5.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 93.w,
                                      height: 90.h,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          child: Image.asset(
                                            storeImages[storeCategories
                                                .indexOf(category)],
                                            fit: BoxFit.cover,
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      category.name,
                                      style: AppTextStyles.smallText().copyWith(
                                        color: const Color(0xFF939393),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: Text("Error loading stories"),
              );
            },
          ),
        ],
      ),
    );
  }
}
