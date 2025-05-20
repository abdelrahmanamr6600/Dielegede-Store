import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/store/data/model/AllStoresModel.dart';
import 'package:dielegende_store/features/store/data/model/StoreDetailsModel.dart';
import 'package:dielegende_store/features/store/data/model/StoreProductModel.dart';
import 'package:equatable/equatable.dart';

abstract class StoreProductsState extends Equatable {
  const StoreProductsState();

  @override
  List<Object> get props => [];
}

class StoreProductsInitial extends StoreProductsState {}

class StoreProductsLoadingState extends StoreProductsState {}

class StoreProductsSuccessState extends StoreProductsState {
  final List<StoreProductsModel> products;

  const StoreProductsSuccessState(this.products);

  @override
  List<Object> get props => [products];
}

class StoreProductsErrorState extends StoreProductsState {
  final String error;

  const StoreProductsErrorState(this.error);

  @override
  List<Object> get props => [error];
}


class AllStoreInitial extends StoreProductsState {}

class AllStoreLoadingState extends StoreProductsState {}

class AllStoreSuccessState extends StoreProductsState {
  final AllStoresModel products;

  const AllStoreSuccessState(this.products);

  @override
  List<Object> get props => [products];
}

class AllStoreErrorState extends StoreProductsState {
  final String error;

  const AllStoreErrorState(this.error);

  @override
  List<Object> get props => [error];
}





