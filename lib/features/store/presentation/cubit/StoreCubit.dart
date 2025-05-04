import 'package:dielegende_store/features/store/data/repo/StroreRepo.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreProductsCubit extends Cubit<StoreProductsState> {
  final StoreProductsRepo storeRepository;

  StoreProductsCubit(this.storeRepository) : super(StoreProductsInitial());

  void getStoreProducts(int storeId) async {
    emit(StoreProductsLoadingState());
    final result = await storeRepository.getStoreProducts(storeId);
    print('Result: $result');
    result.fold(
      (failure) {
        print('Error: ${failure.errorMessage}');
        emit(StoreProductsErrorState(failure.errorMessage));

        emit(StoreProductsErrorState(failure.errorMessage));
      },
      (products) => emit(StoreProductsSuccessState(products.products)),
    );
  }
}
