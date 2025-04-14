import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/CustomButton.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItem.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItemSkeleton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/assets.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final pagingController = context.read<HomeCubit>().pagingController;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Products",
                style: AppTextStyles.mainText().copyWith(
                    color: const Color(0xFF393F42),
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/filtersScreen');
                },
                child: Row(
                  children: [
                    Text(
                      "Filters",
                      style: AppTextStyles.smallText().copyWith(
                        color: const Color(0xFF393F42),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      AssetsData.filter,
                      width: 12.w,
                      height: 12.h,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.h),
            child: PagedGridView<int, ProductModel>(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              pagingController: pagingController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.7,
              ),
              builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                itemBuilder: (context, product, index) => ProductItem(
                  product: product,
                ),
                firstPageErrorIndicatorBuilder: (context) => const Center(
                  child: Text("Error loading products"),
                ),
                noItemsFoundIndicatorBuilder: (context) => const Center(
                  child: Text("No products found"),
                ),
                firstPageProgressIndicatorBuilder: (context) =>
                    GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 6,   
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => const ProductItemSkeleton(),
                ),
                newPageProgressIndicatorBuilder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
