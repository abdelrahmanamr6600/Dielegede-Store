import 'package:dielegende_store/core/shared/fun/handleAuthActionRequired.dart';
import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreCubit.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreState.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreDetailsCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreDetailsState.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:dielegende_store/features/store/presentation/ui/widgets/StoreDetailsSkeleton.dart';
import 'package:dielegende_store/features/store/presentation/ui/widgets/StoreProductLoadingSkeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key, required this.storeId});
  final int storeId;

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {

  @override
  void initState() {
    super.initState();
    context.read<StoreDetailsCubit>().getStoreDetails(widget.storeId);
    context.read<FollowStoreCubit>().loadFollwedIds();
  }   

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/kids.png",
      "assets/images/women.png",
      "assets/images/men.png",
      "assets/images/hoody.png",
      "assets/images/t-shirt.png"
    ];

    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        if (state is StoreDetailsLoadingState) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: StoreDetailsLoadingSkeleton(),
            
          );
        } else if (state is StoreDetailsrrorState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(title: 'Error'),
            body: Center(child: Text(state.error)),
          );
        } else if (state is StoreDetailsSuccessState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              title: state.products.name 
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                      child: Image.asset(
                        "assets/images/store.png",
                        width: 375.w,
                        height: 300.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/store_logo.png",
                            width: 148.w,
                            height: 37.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8.h),
                          Text(state.products.name ?? "",
                              style: AppTextStyles.largeText().copyWith(
                                  color: blackColor, fontSize: 26.sp)),
                          SizedBox(height: 8.h),
                          Text(
                            state.products.description ?? "",
                            style: AppTextStyles.mainText().copyWith(
                                color: const Color(0xFF000000),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            children: [
                              Text("Products",
                                  style: AppTextStyles.largeText().copyWith(
                                      color: const Color(0xFF000000),
                                      fontSize: 20.sp)),
                              const Spacer(),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: mainColor,
                                ),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 160.h,
                            child: ListView.separated(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 10.w),
                              itemBuilder: (context, index) {
                                final item = state.products.products[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: item.images.isNotEmpty
                                          ? Image.asset(
                                              images[index],
                                              width: 100.w,
                                              height: 100.h,
                                              fit: BoxFit.cover,
                                            )
                                          : Container(
                                              width: 100.w,
                                              height: 100.h,
                                              color: Colors.grey[300],
                                              child: const Icon(
                                                  Icons.image_not_supported),
                                            ),
                                    ),
                                    SizedBox(height: 4.h),
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        item.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            AppTextStyles.smallText().copyWith(
                                          color: const Color(0xFF000000),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        context.push(
                          "/StoreLocationScreen",
                          extra: state.products.address,
                        );
                      },
                      redius: 25.r,
                      height: 45.h,
                      text: "View Location",
                      borderColor: mainColor,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  BlocBuilder<FollowStoreCubit, FollowStoreState>(
                    builder: (context, state) {
                      final isFollow =
                          state.followedIds.contains(widget.storeId);

                      return GestureDetector(
                        onTap: () async {
                          await handleAuthRequiredAsyncAction(context,
                              () async {
                            context
                                .read<FollowStoreCubit>()
                                .toggleFollowing(widget.storeId);
                          });
                        },
                        child: isFollow
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "Following",
                                  style: AppTextStyles.smallText().copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : Container(
                                width: 45.w,
                                height: 45.w,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/add.svg",
                                    width: 10.w,
                                    height: 10.h,
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
