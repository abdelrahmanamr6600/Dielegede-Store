import 'package:dielegende_store/features/category/data/repo/CategoryRepo.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo ) : super(CategoryInitial());
  final CategoryRepo categoryRepo;

  Future<void> getCategory() async {
    emit(CategoryLoading());

    final result = await categoryRepo.fetchCategory();
    result.fold(
      (failure) {
        emit(CategoryFailure(failure.errorMessage));
      },
      (category) {
        emit(CategorySuccess(category));
      },
    );
  }
}
