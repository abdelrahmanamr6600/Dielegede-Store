import 'package:dielegende_store/features/category/data/repo/CategoryRepo.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryProductState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit(this.categoryRepo) : super(CategoryProductInitial());
  final CategoryRepo categoryRepo;

  Future<void> getCategoryProduct(int categoryId) async {
    if (isClosed) return;

    emit(CategoryProductLoading());

    final result = await categoryRepo.fetchCategoryProducts(categoryId);
    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) emit(CategoryProductFailure(failure.errorMessage));
      },
      (category) {
        if (!isClosed) emit(CategoryProductSuccess(category));
      },
    );
  }
}
