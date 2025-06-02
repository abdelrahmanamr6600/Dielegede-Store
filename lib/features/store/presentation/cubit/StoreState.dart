import 'package:dielegende_store/features/store/data/model/AllStoresModel.dart';
import 'package:equatable/equatable.dart';

abstract class StoreProductsState extends Equatable {
  const StoreProductsState();

  @override
  List<Object> get props => [];
}

class StoreProductsInitial extends StoreProductsState {}

class StoreProductsLoadingState extends StoreProductsState {}

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





