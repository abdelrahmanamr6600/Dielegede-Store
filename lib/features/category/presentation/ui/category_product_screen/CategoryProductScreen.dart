import 'package:dielegende_store/core/shared/fun/LoginRequiredBottomSheet.dart';
import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItem.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItemSkeleton.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryProductCubit.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryProductState.dart';
import 'package:dielegende_store/features/category/presentation/ui/widgets/CategoryProductItem.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoruProductScreen extends StatefulWidget {
  const CategoruProductScreen({
    super.key,
    required this.categoryProductId,
    this.categoryName,
  });
  final int categoryProductId;
  final String? categoryName;

  @override
  State<CategoruProductScreen> createState() => _CategoruProductScreenState();
}

class _CategoruProductScreenState extends State<CategoruProductScreen> {
  @override
  void initState() {
    super.initState();
    WishListCubit wishListCubit = context.read<WishListCubit>();
    wishListCubit.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "${widget.categoryName}",
        ),
        body: BlocBuilder<CategoryProductCubit, CategoryProductState>(
          builder: (context, state) {
            if (state is CategoryProductLoading) {
              return Padding(
                padding: EdgeInsets.all(8.0.w),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const ProductItemSkeleton();
                    }),
              );
            } else if (state is CategoryProductFailure) {
              return Center(child: Text(state.message));
            } else if (state is CategoryProductSuccess) {
              return Padding(
                padding: EdgeInsets.all(8.w),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: state.response.data.products.data.length,
                    itemBuilder: (context, index) {
                      final product = state.response.data.products.data[index];
                      return CategoryProductItem(
                        product: product,
                        showButton: false,
                      );
                    }),
              );
            }

            return const SizedBox.shrink();
          },
        ));
  }
}
