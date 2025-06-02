import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/features/filter/data/FilterProductRepo.dart';
import 'package:dielegende_store/features/filter/presentation/cubit/FilterProdctState.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';


class FilterCubit extends Cubit<FilterState> {
  final FilterRepo filterRepo;

  FilterCubit(this.filterRepo) : super(FilterInitial());

  Future<void> getFilteredProducts({
     double? minPrice,
     double? maxPrice,
     List<String>? selectedColors,
  List<String>? selectedSizes,
  }) async {
    emit(FilterLoading());

    final Either<Failure, List<ProductModel>> result =
        await filterRepo.getFilteredProducts(
      minPrice: minPrice,
      maxPrice: maxPrice,
      selectedColors: selectedColors,
      selectedSizes: selectedSizes,
    );

    result.fold(
      (failure) => emit(FilterFailure(failure.errorMessage)),
      (products) => emit(FilterSuccess(products)),
    );
  }
}
