
import 'package:dielegende_store/features/category/data/model/CategoryModel.dart';
import 'package:dielegende_store/features/home/data/model/StoreModel.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final HomeCategoryModel response;

  CategorySuccess(this.response);
}

class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure(this.message);
}
