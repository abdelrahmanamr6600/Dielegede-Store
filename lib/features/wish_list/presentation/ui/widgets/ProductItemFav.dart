import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/wish_list/data/model/WishListModel.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemFav extends StatelessWidget {
  final FavoriteProduct? product;
  final bool showButton;

  const ProductItemFav(
      {super.key, required this.product, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push('/productDetailsScreen');
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
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      "assets/images/hoody.png",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 15.h,
                    left: 10.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        "\$${product?.product?.price ?? 0}",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: BlocBuilder<WishListCubit, WishListState>(
                      builder: (context, state) {
                        final isLoading = context
                            .watch<WishListCubit>()
                            .state
                            .loadingIds
                            .contains(product?.product?.id);
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<WishListCubit>()
                                .removeFromWishList(product?.product?.id ?? 0);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.check_circle,
                                        color: Colors.white),
                                    SizedBox(width: 8.w),
                                    Text(
                                        style: AppTextStyles.smallText(),
                                        'Removed from favorites successfully'),
                                  ],
                                ),
                                backgroundColor: mainColor,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: isLoading
                                ? Center(
                                    child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ))
                                : Center(
                                    child: SvgPicture.asset(
                                        width: 15.w,
                                        height: 15.h,
                                        "assets/icons/activatedHeart.svg"),
                                  ),
                          ),
                        );
                      },
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
                  Text(
                    product?.product?.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.smallText().copyWith(
                      color: const Color(0xFF393F42),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    product?.product?.description ?? "",
                    style: AppTextStyles.smallText().copyWith(
                      fontSize: 8.sp,
                      color: greyColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  if (showButton)
                    CustomButton(
                      onPressed: () {},
                      text: "Book in bag",
                      height: 30.h,
                      color: mainColor,
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
