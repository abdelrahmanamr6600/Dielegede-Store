import 'package:dielegende_store/features/wish_list/data/model/WishListModel.dart';

class WishListState {
  final Set<int> favoriteIds;

  WishListState({required this.favoriteIds});

  WishListState copyWith({
    Set<int>? favoriteIds,
  }) {
    return WishListState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }
}

class WishListLoading extends WishListState {
  WishListLoading() : super(favoriteIds: {}, );
}

class WishListSuccess extends WishListState {
  final List<WishlistItem> items;

  WishListSuccess(this.items) : super(favoriteIds: {},);
}

class WishListFailure extends WishListState {
  final String message;

  WishListFailure(this.message) : super(favoriteIds: {},);
}
class WishListEmpty extends WishListState {

  WishListEmpty() : super(favoriteIds: {},);
}
