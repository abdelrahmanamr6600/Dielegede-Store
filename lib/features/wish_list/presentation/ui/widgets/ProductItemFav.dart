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

class ProductItemFav extends StatefulWidget {
  final WishlistItem? product;
  final bool showButton;

  const ProductItemFav({
    super.key,
    required this.product,
    this.showButton = true,
  });

  @override
  State<ProductItemFav> createState() => _ProductItemFavState();
}

class _ProductItemFavState extends State<ProductItemFav> {
  bool isRemoving = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isRemoving ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedScale(
        scale: isRemoving ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: () {
            context.push('/productDetailsScreen',
                extra: widget.product?.product);
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            "\$${widget.product?.product.price ?? 0}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.sp),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: BlocBuilder<WishListCubit, WishListState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () async {
                                if (isRemoving) return;
                                setState(() {
                                  isRemoving = true;
                                });

                                await context
                                    .read<WishListCubit>()
                                    .removeFromWishList(
                                        widget.product?.product.id ?? 0);
                              },
                              child: Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    width: 15.w,
                                    height: 15.h,
                                    "assets/icons/activatedHeart.svg",
                                  ),
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
                        widget.product?.product.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.smallText().copyWith(
                          color: const Color(0xFF393F42),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        widget.product?.product.description ?? "",
                        style: AppTextStyles.smallText().copyWith(
                          fontSize: 8.sp,
                          color: greyColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // SizedBox(height: 5.h),
                      // if (widget.showButton)
                      //   CustomButton(
                      //     onPressed: () {},
                      //     text: "Book in bag",
                      //     height: 30.h,
                      //     color: mainColor,
                      //   ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
