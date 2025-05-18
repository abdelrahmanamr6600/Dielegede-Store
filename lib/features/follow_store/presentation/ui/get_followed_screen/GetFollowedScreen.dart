import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreCubit.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreState.dart';
import 'package:dielegende_store/features/follow_store/presentation/ui/widget/FollowedStoresItem.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/ui/all_stores_screen/AllStoresScreen.dart';
import 'package:dielegende_store/features/store/presentation/ui/widgets/AllStoreLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowedStoreScreen extends StatelessWidget {
  const FollowedStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<FollowStoreCubit>()..getFollowers(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: "Followed Store",
          ),
          body: BlocBuilder<FollowStoreCubit, FollowStoreState>(
            builder: (context, state) {
              if (state is FollowedStoreLoading) {
                return const AllStoreLoadingSkeleton();
              } else if (state is FollowedStoreFailure) {
                return Center(child: Text(state.message));
              } else if (state is FollowedStoreSuccess) {
                final stores = state.items.data.data;
                final dummyImages = List.generate(
                    stores.length, (_) => "assets/images/store1.png");
                return FollowedStoresItemWidget(
                    stores: stores, images: dummyImages);
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
