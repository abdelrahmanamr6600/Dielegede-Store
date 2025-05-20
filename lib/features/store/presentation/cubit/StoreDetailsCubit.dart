import 'package:dielegende_store/features/store/data/repo/StroreRepo.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreDetailsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final StoreRepo storeRepository;

  StoreDetailsCubit(this.storeRepository) : super(StoreDetailsInitialState());

  void getStoreDetails(int storeId) async {
    emit(StoreDetailsLoadingState());
    final result = await storeRepository.getStoreDtetails(storeId);
    result.fold(
      (failure) => emit(StoreDetailsrrorState(failure.errorMessage)),
      (store) => emit(StoreDetailsSuccessState(store)),
    );
  }
}
