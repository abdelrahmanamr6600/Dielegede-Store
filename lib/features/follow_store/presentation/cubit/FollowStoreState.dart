import 'package:dielegende_store/features/follow_store/data/FollowedStoresModel.dart';


class FollowStoreState {
  final Set<int> followedIds;

  FollowStoreState({required this.followedIds});

  FollowStoreState copyWith({
    Set<int>? followedIds,
  }) {
    return FollowStoreState(
      followedIds: followedIds ?? this.followedIds,
    );
  }
  
 }

class FollowedStoreLoading extends FollowStoreState {
 FollowedStoreLoading() : super(followedIds: {});
}

class FollowedStoreSuccess extends FollowStoreState {
  final FollowedStoresResponse items;

 FollowedStoreSuccess(this.items) : super(followedIds: {}, );
}

class FollowedStoreFailure extends FollowStoreState {
  final String message;

 FollowedStoreFailure(this.message) : super(followedIds: {},);
}



