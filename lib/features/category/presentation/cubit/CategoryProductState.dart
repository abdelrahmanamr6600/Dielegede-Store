import 'package:dielegende_store/features/category/data/model/CategoryProductModel.dart';

abstract class CategoryProductState {}

class CategoryProductInitial extends CategoryProductState {}

class CategoryProductLoading extends CategoryProductState {}

class CategoryProductSuccess extends CategoryProductState {
  final CategoryProductsResponse response;

  CategoryProductSuccess(this.response);
}

class CategoryProductFailure extends CategoryProductState {
  final String message;

  CategoryProductFailure(this.message);
}
