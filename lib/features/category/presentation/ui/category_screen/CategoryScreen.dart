import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';

import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryState.dart';
import 'package:dielegende_store/features/category/presentation/ui/widgets/CategoryItemSkeleton.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getCategory();
    WishListCubit wishListCubit = context.read<WishListCubit>();
    wishListCubit.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "All Categories",
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Padding(
              padding: EdgeInsets.all(16.0.w),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const CategorySkeletonItem();
                },
              ),
            );
          } else if (state is CategoryFailure) {
            return const Center(child: Text("Failed to load categories"));
          } else if (state is CategorySuccess) {
            final categories = state.response.data.categories;

            return Padding(
              padding: EdgeInsets.all(16.0.w),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final bgColor = index % 4 == 0 || index % 4 == 3
                      ? const Color(0xFF47BCE5).withOpacity(0.6)
                      : const Color(0xFFE6FBF8);
                  return GestureDetector(
                    onTap: () {
                      context.push('/categoryProductScreen', extra: {
                        'id': categories[index].id,
                        'name': categories[index].name,
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(categories[index].name,
                                style: AppTextStyles.largeText().copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    color: darkGreyColor.withOpacity(0.8))),
                          ),
                          SizedBox(height: 8.h),
                          Image.asset(
                            "assets/images/categ_shoes.png",
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
