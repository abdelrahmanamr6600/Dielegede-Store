import 'package:dielegende_store/core/shared/fun/handleAuthActionRequired.dart';
import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreCubit.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreState.dart';
import 'package:dielegende_store/features/store/data/model/AllStoresModel.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:dielegende_store/features/store/presentation/ui/widgets/AllStoreLoading.dart';
import 'package:dielegende_store/features/store/presentation/ui/widgets/StoreProductLoadingSkeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AllStoresScreen extends StatefulWidget {
  const AllStoresScreen({super.key});

  @override
  State<AllStoresScreen> createState() => _AllStoresScreenState();
}

class _AllStoresScreenState extends State<AllStoresScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FollowStoreCubit>().loadFollwedIds();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/store1.png",
      "assets/images/store2.png",
      "assets/images/store3.png",
    ];
    return BlocProvider.value(
        value: context.read<StoreProductsCubit>()..getAllStores(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const CustomAppBar(title: "All Stores"),
          body: BlocBuilder<StoreProductsCubit, StoreProductsState>(
            builder: (context, state) {
              if (state is AllStoreLoadingState) {
                return const AllStoreLoadingSkeleton();
              } else if (state is AllStoreErrorState) {
                return Center(child: Text(state.error));
              } else if (state is AllStoreSuccessState) {
                final stores = state.products.data.stores;
                return StoresItemWidget(stores: stores, images: images);
              }
              return const SizedBox();
            },
          ),
        ));
  }
}

class StoresItemWidget extends StatelessWidget {
  const StoresItemWidget({
    super.key,
    required this.stores,
    required this.images,
  });

  final List<AllStoreProductsModel> stores;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
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
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            images[index],
                            width: double.infinity,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8.h,
                          right: 8.w,
                          child:
                              BlocBuilder<FollowStoreCubit, FollowStoreState>(
                            builder: (context, state) {
                              final isFollow =
                                  state.followedIds.contains(item.id);

                              return GestureDetector(
                                  onTap: () async {
                                    await handleAuthRequiredAsyncAction(context,
                                        () async {
                                      context
                                          .read<FollowStoreCubit>()
                                          .toggleFollowing(item.id);
                                    });
                                  },
                                  child: isFollow
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w, vertical: 8.h),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Text(
                                            "Following",
                                            style: AppTextStyles.smallText()
                                                .copyWith(
                                              color: blackColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ))
                                      : Container(
                                          padding: EdgeInsets.all(4.w),
                                          decoration: const BoxDecoration(
                                            color: greyColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                            "assets/icons/add.svg",
                                            width: 15.w,
                                            height: 15.h,
                                          ),
                                        ));
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
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
