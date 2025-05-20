import 'package:dielegende_store/features/wish_list/data/model/WishListModel.dart';

class WishListState {
  final Set<int> favoriteIds;
  final Set<int> loadingIds;

  WishListState({required this.favoriteIds, required this.loadingIds});

  WishListState copyWith({
    Set<int>? favoriteIds,
    Set<int>? loadingIds,
  }) {
    return WishListState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
      loadingIds: loadingIds ?? this.loadingIds,
    );
  }
}

class WishListLoading extends WishListState {
  WishListLoading() : super(favoriteIds: {}, loadingIds: {});
}

class WishListSuccess extends WishListState {
  final List<WishlistItem> items;

  WishListSuccess(this.items) : super(favoriteIds: {}, loadingIds: {});
}

class WishListFailure extends WishListState {
  final String message;

  WishListFailure(this.message) : super(favoriteIds: {}, loadingIds: {});
}
