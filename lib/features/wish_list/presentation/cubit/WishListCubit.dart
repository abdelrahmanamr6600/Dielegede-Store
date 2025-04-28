import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/features/wish_list/data/model/WishListModel.dart';
import 'package:dielegende_store/features/wish_list/data/repo/WishListRepo.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListState.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState> {
  final WishListRepo wishListRepo;

  WishListCubit(this.wishListRepo)
      : super(WishListState(
          favoriteIds: <int>{},
          loadingIds: <int>{},
        ));

  void toggleFavorite(int productId) async {
    final isFav = state.favoriteIds.contains(productId);

    emit(state.copyWith(
      loadingIds: {...state.loadingIds, productId},
      favoriteIds: isFav
          ? (Set.of(state.favoriteIds)..remove(productId))
          : (Set.of(state.favoriteIds)..add(productId)),
    ));

    try {
      if (isFav) {
        await wishListRepo.removeFromWishList(productId);
      } else {
        await wishListRepo.addToWishList(productId);
      }
    } catch (e) {
      emit(state.copyWith(
        favoriteIds: isFav
            ? (Set.of(state.favoriteIds)..add(productId))
            : (Set.of(state.favoriteIds)..remove(productId)),
      ));
    }

    emit(state.copyWith(
      loadingIds: Set.of(state.loadingIds)..remove(productId),
    ));
  }

  void loadFavorites() async {
    try {
      final favoriteIds = await wishListRepo.getFavoriteProductIds();
      emit(state.copyWith(favoriteIds: favoriteIds.toSet()));
    } catch (e) {
      print("Error loading favorites: $e");
    }
  }

  Future<void> getWishList() async {
    emit(WishListLoading());
    final response = await wishListRepo.getWishList();
    return response.fold(
      (failure) {
        print("Error: ${failure.errorMessage}");
        emit(WishListFailure(failure.errorMessage));
      },
      (response) {
        emit(WishListSuccess(response.data.products));
      },
    );
  }

  Future<void> removeFromWishList(int productId) async {
    try {
      await wishListRepo.removeFromWishList(productId);

      if (state is WishListSuccess) {
        final currentState = state as WishListSuccess;
        final updatedList = List<FavoriteProduct>.from(currentState.items)
          ..removeWhere((item) => item.product?.id == productId);

        emit(WishListSuccess(updatedList));
      }
    } catch (e) {
      print("Error removing item: $e");
      emit(WishListFailure("Failed to remove item from wish list."));
    }
  }
}
  
  // void setFavorites(List<int> favIds) {
  //   emit(state.copyWith(favoriteIds: favIds));
  // }

