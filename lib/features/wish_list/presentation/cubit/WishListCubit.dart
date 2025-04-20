import 'package:dielegende_store/features/wish_list/data/repo/WishListRepo.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishlistState> {
  WishListCubit(super.initialState, this.wishlistRepository);

  final WishListRepo wishlistRepository;

  Future<void> toggleWishlist(int productId, bool isFavorite) async {
    emit(WishlistLoading(productId: productId));

    try {
      if (isFavorite) {
        await wishlistRepository.removeFromWishList(productId);
        emit(WishlistRemoved(productId: productId));
      } else {
        await wishlistRepository.addToWishList(productId);
      }
    } catch (e) {
      emit(WishlistError(message: e.toString(), productId: productId));
    }
  }
}

  // Future<void> toogleFavourite(int productId, bool isFav) async {
  //   try {
  //     emit(state.copyWith(isLoading: true));
  //     if (isFav) {
  //       await repo.removeFromWishList(productId);
  //     } else {
  //       await repo.addToWishList(productId);
  //     }

  //     final updateFavourites = Map<int, bool>.from(state.favourites);
  //     updateFavourites[productId] = !isFav;

  //     emit(state.copyWith(favourites: updateFavourites, isLoading: false)); 
  //   } catch (e) {
  //     emit(state.copyWith(isLoading: false));
  //   }
  // }

  // Future<void> getWishList(int produtId) async {
  //   final result = await repo.getWishList();
  //   result.fold(
  //     (failure) {
  //       emit(AddToWishListFailure(failure.errorMessage));
  //     },
  //     (response) {
  //       emit(AddToWishListSuccess(response));
  //     },
  //   );
  // }

