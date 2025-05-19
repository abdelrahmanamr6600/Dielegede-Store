import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {} 
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {
  final List<ProductModel> products;
  SearchSuccessState(this.products);
}
class SearchFailureState extends SearchState {
  final String errorMessage;
  SearchFailureState(this.errorMessage);
}
