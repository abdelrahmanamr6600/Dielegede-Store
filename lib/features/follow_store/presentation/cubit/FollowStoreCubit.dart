import 'package:dielegende_store/features/follow_store/data/FollowStoreRepo.dart';
import 'package:dielegende_store/features/follow_store/presentation/cubit/FollowStoreState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowStoreCubit extends Cubit<FollowStoreState> {
  final FollowStoreRepo followStoreRepo;
  FollowStoreCubit(this.followStoreRepo)
      : super(FollowStoreState(followedIds: <int>{})) {
    print("FollowStoreCubit Created");
  }

  void toggleFollowing(int productId) async {
    final isFollow = state.followedIds.contains(productId);

    emit(state.copyWith(
      followedIds: isFollow
          ? (Set.of(state.followedIds)..remove(productId))
          : (Set.of(state.followedIds)..add(productId)),
    ));

    try {
      if (isFollow) {
        await followStoreRepo.unFollowStore(productId);
      } else {
        await followStoreRepo.followStore(productId);
      }
    } catch (e) {
      emit(state.copyWith(
        followedIds: isFollow
            ? (Set.of(state.followedIds)..add(productId))
            : (Set.of(state.followedIds)..remove(productId)),
      ));
    }

    // emit(state.copyWith(
    //   loadingIds: Set.of(state.loadingIds)..remove(productId),
    // ));
  }

  Future<void> getFollowers() async {
    emit(FollowedStoreLoading());
    final response = await followStoreRepo.getFollowedStores();
    return response.fold(
      (failure) {
        print("Error: ${failure.errorMessage}");
        emit(FollowedStoreFailure(failure.errorMessage));
      },
      (response) {
        emit(FollowedStoreSuccess(response));
      },
    );
  }

  void loadFollwedIds() async {
    try {
      final followedIds = await followStoreRepo.getFollowedStoresIds();
      emit(state.copyWith(followedIds: followedIds.toSet()));
    } catch (e) {
      print("Error loading favorites: $e");
    }
  }
}
