import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreCubit.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreState.dart';
import 'package:dielegende_store/features/follow_store/presentation/ui/widget/FollowedStoresItem.dart';
import 'package:dielegende_store/features/store/presentation/ui/widgets/AllStoreLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FollowedStoreScreen extends StatefulWidget {
  const FollowedStoreScreen({super.key});

  @override
  State<FollowedStoreScreen> createState() => _FollowedStoreScreenState();
}

class _FollowedStoreScreenState extends State<FollowedStoreScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FollowStoreCubit>().getFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Followed Store",
      ),
      body: BlocBuilder<FollowStoreCubit, FollowStoreState>(
        builder: (context, state) {
          if (state is FollowedStoreLoading) {
            return const AllStoreLoadingSkeleton();
          } else if (state is FollowedStoreFailure) {
            return Center(child: Text(state.message));
          } else if (state is FollowedStoreSuccess) {
            final data = state.items.data;
            if (data == null || data.data.isEmpty) {
              return const NoDataWidget();
            }
            final stores = data.data;
            final dummyImages =
                List.generate(stores.length, (_) => "assets/images/store1.png");
            return FollowedStoresItemWidget(
              stores: stores,
              images: dummyImages,
              onItemTap: (item) {
                context.push('/StoreDetailsScreen', extra: item.id).then((_) {
                  if (context.mounted) {
                    context.read<FollowStoreCubit>().getFollowers();
                  }
                });
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}


class NoDataWidget extends StatelessWidget {
  final String? imagePath;
  final Color? color;

  const NoDataWidget({
    super.key,
    this.imagePath = "assets/images/empty_store.png",
    this.color = const Color(0xFF47BCE5),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath!,
            height: 200.h,
          ),
        ],
      ),
    );
  }
}
