import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/EmptySearchResult.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItem.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItemSkeleton.dart';
import 'package:dielegende_store/features/filter/presentation/cubit/FilterProdctState.dart';
import 'package:dielegende_store/features/filter/presentation/cubit/FilterProductCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredProductsScreen extends StatelessWidget {
  const FilteredProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Filtered Products"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
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
                  } else if (state is FilterSuccess) {
                    if (state.products.isEmpty) {
                      return const EmptySearchResultWidget(
                        message: "No Product Found",
                      );
                    }
                    return GridView.builder(
                      itemCount: state.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final productItem = state.products[index];
                        return ProductItem(
                          product: productItem,
                        );
                      },
                    );
                  } else if (state is FilterFailure) {
                    return Center(child: Text("Error: ${state.error}"));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
