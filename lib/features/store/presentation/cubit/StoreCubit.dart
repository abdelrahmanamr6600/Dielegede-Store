import 'package:dielegende_store/features/store/data/repo/StroreRepo.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreProductsCubit extends Cubit<StoreProductsState> {
  final StoreRepo storeRepository;

  StoreProductsCubit(this.storeRepository) : super(StoreProductsInitial());

  void getStoreProducts(int storeId) async {
    emit(StoreProductsLoadingState());
    final result = await storeRepository.getStoreProducts(storeId);
    print('Result: $result');
    result.fold(
      (failure) {
        print('Error: ${failure.errorMessage}');
        emit(StoreProductsErrorState(failure.errorMessage));
      },
      (products) => emit(StoreProductsSuccessState(products.data.data)),
    );
  }

  Future<void> getAllStores() async {
    emit(AllStoreLoadingState());
    final result = await storeRepository.getAllStores();
    print('Result: $result');
    result.fold(
      (failure) {
        print('Error: ${failure.errorMessage}');
        emit(AllStoreErrorState(failure.errorMessage));
      },
      (stores) => emit(AllStoreSuccessState(stores)),
    );
  }
}
