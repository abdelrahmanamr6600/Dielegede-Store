import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/ProductGridView.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItemSkeleton.dart';
import 'package:dielegende_store/core/shared/widgets/SearchWidget.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListState.dart';
import 'package:dielegende_store/features/wish_list/presentation/ui/widgets/ProductItemFav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late final WishListCubit wishListCubit;

  @override
  void initState() {
    super.initState();
    wishListCubit = context.read<WishListCubit>();
    wishListCubit.getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Wish List',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // const SearchWidget(),
            // SizedBox(height: 12.h),
            Expanded(
              child: BlocBuilder<WishListCubit, WishListState>(
                builder: (context, state) {
                  if (state is WishListLoading) {
                    return GridView.builder(
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
                        });
                  } else if (state is WishListFailure) {
                    return Center(child: Text(state.message));
                  } else if (state is WishListEmpty) {
                    return Lottie.asset(
                      "assets/images/empty_wish_list.json",
                      height: 150.h,
                      repeat: true,
                      fit: BoxFit.contain,
                    );
                  } else if (state is WishListSuccess) {
                    return GridView.builder(
                      itemCount: state.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final wishListItem = state.items[index];
                        return ProductItemFav(
                          key: ValueKey(wishListItem.product.id),
                          product: wishListItem,
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text("No items found"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
