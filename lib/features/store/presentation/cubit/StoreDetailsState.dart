import 'package:dielegende_store/features/store/data/model/StoreDetailsModel.dart';
class StoreDetailsState  {}
class StoreDetailsInitialState extends StoreDetailsState {}

class StoreDetailsLoadingState extends StoreDetailsState {}

class StoreDetailsSuccessState extends StoreDetailsState {
  final StoreDetailsModel products;

   StoreDetailsSuccessState(this.products);

  @override
  List<Object> get props => [products];
}

class StoreDetailsrrorState extends StoreDetailsState {
  final String error;

   StoreDetailsrrorState(this.error);

  @override
  List<Object> get props => [error];
}
