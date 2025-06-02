import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/EmptySearchResult.dart';
import 'package:dielegende_store/core/shared/widgets/ProductGridView.dart';
import 'package:dielegende_store/core/shared/widgets/ProductItemSkeleton.dart';
import 'package:dielegende_store/core/shared/widgets/SearchWidget.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/search/presentation/cubit/SearchCubit.dart';
import 'package:dielegende_store/features/search/presentation/cubit/SearchState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: "Search",
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SearchWidget(),
              SizedBox(height: 12.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitialState) {
                      return const EmptySearchResultWidget(
                        message: "",
                      );
                    } else if (state is SearchLoadingState) {
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
                    } else if (state is SearchFailureState) {
                      return Center(child: Text(state.errorMessage));
                    } else if (state is SearchSuccessState) {
                      if (state.products.isEmpty) {
                        return const EmptySearchResultWidget();
                      }
                      return ProductGridView(products: state.products);
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
