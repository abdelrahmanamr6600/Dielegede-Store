import 'package:dielegende_store/features/follow_store/data/FollowedStoresModel.dart';
import 'package:dielegende_store/features/store/data/model/AllStoresModel.dart';
import 'package:dielegende_store/features/store/data/repo/StroreRepo.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreProductsCubit extends Cubit<StoreProductsState> {
  final StoreRepo storeRepository;

  StoreProductsCubit(this.storeRepository) : super(StoreProductsInitial());

   AllStoresModel? allStores ; // <-- نحتفظ بجميع المحلات هنا

  Future<void> getAllStores() async {
    emit(AllStoreLoadingState());
    final result = await storeRepository.getAllStores();
    result.fold(
      (failure) {
        emit(AllStoreErrorState(failure.errorMessage));
      },
      (stores) {
        allStores = stores; 
        emit(AllStoreSuccessState(stores));
      },
    );
  }
}
