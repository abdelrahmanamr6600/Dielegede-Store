import 'package:dielegende_store/core/shared/fun/LoginRequiredBottomSheet.dart';
import 'package:dielegende_store/core/shared/fun/handleAuthActionRequired.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/CustomSnackbar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagCubit.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagState.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  final bool showButton;

  const ProductItem({super.key, required this.product, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/productDetailsScreen', extra: product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            'assets/images/category_w.png',
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 15.h,
                          left: 10.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              "\$${product.price}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: BlocBuilder<WishListCubit, WishListState>(
                              builder: (context, state) {
                                final isFavorite = context
                                    .watch<WishListCubit>()
                                    .state
                                    .favoriteIds
                                    .contains(product.id);

                                return Center(
                                    child: InkWell(
                                  onTap: () async {
                                    await handleAuthRequiredAsyncAction(context,
                                        () async {
                                      context
                                          .read<WishListCubit>()
                                          .toggleFavorite(product.id);
                                    });
                                  },
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return ScaleTransition(
                                          scale: animation, child: child);
                                    },
                                    child: SvgPicture.asset(
                                      width: 15.w,
                                      height: 15.h,
                                      key: ValueKey(isFavorite),
                                      isFavorite
                                          ? "assets/icons/activatedHeart.svg"
                                          : "assets/icons/inactiveHeart.svg",
                                    ),
                                  ),
                                ));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyles.smallText().copyWith(
                              color: const Color(0xFF393F42), fontSize: 14.sp),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(AssetsData.rate,
                      //         width: 10.w, height: 8.h),
                      //     SizedBox(width: 5.w),
                      //     Text(
                      //       product.category.,
                      //       style: AppTextStyles.smallText().copyWith(
                      //           color: Colors.black,
                      //           fontSize: 8.sp,
                      //           fontWeight: FontWeight.w700),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    product.category?.name ?? "",
                    style: AppTextStyles.smallText()
                        .copyWith(fontSize: 8.sp, color: greyColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  BlocConsumer<BagCubit, Bagstate>(
                    listener: (context, state) {
                      if (state is BagItemAddedSuccessState &&
                          state.productId == product.id) {
                        showCustomSnackBar(context, "Product added to bag",
                            icon: Icons.check_circle,
                            backgroundColor: mainColor,
                            fontSize: 14.sp);
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is BagItemAddedLoadingState &&
                          state.productId == product.id;

                      return isLoading
                          ? Center(
                              child: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: const CircularProgressIndicator(
                                  color: mainColor,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : CustomButton(
                              onPressed: () async {
                                await handleAuthRequiredAsyncAction(context,
                                    () async {
                                  await context.read<BagCubit>().addToBag(
                                        productId: product.id,
                                      );
                                });
                              },
                              text: "Book in bag",
                              color: mainColor,
                              redius: 25.r,
                              height: 30.h,
                            );
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
