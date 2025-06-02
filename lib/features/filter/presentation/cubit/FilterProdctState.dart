import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:equatable/equatable.dart';

abstract class FilterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterSuccess extends FilterState {
  final List<ProductModel> products;

  FilterSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class FilterFailure extends FilterState {
  final String error;

  FilterFailure(this.error);

  @override
  List<Object?> get props => [error];
}
