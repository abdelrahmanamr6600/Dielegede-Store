import 'package:dielegende_store/core/shared/widgets/EmptySearchResult.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItem.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItemSkeleton.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';

class HomeProductGrid extends StatelessWidget {
  const HomeProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final pagingController = context.read<HomeCubit>().pagingController;
    return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        sliver: PagedSliverGrid<int, ProductModel>(
            pagingController: pagingController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            builderDelegate: PagedChildBuilderDelegate<ProductModel>(
              itemBuilder: (context, product, index) =>
                  ProductItem(product: product),
              firstPageProgressIndicatorBuilder: (context) => Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width:
                        (MediaQuery.of(context).size.width - 16.w * 2 - 10.w) /
                            2,
                    child: const ProductItemSkeleton(),
                  ),
                ),
              ),
              newPageProgressIndicatorBuilder: (context) =>
                  Wrap(spacing: 10.w, runSpacing: 10.h, children: [
                SizedBox(
                  width:
                      (MediaQuery.of(context).size.width - 16.w * 2 - 10.w) / 2,
                  child: const ProductItemSkeleton(),
                ),
              ]),
              noItemsFoundIndicatorBuilder: (context) => const Center(
                child: EmptySearchResultWidget(),
              ),
              firstPageErrorIndicatorBuilder: (context) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "failed to load products",
                      style: AppTextStyles.smallText()
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<HomeCubit>()
                            .pagingController
                            .retryLastFailedRequest();
                        context.read<WishListCubit>().loadFavorites();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Try Again',
                        style:
                            AppTextStyles.mainText().copyWith(color: mainColor),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
