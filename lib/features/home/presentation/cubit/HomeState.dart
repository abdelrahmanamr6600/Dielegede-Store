import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

abstract class HometState {}
class HomeInitial extends HometState {}

class ProductInitial extends HometState {}
class ProductLoading extends HometState {}
class ProductSuccess extends HometState {
  final List<ProductModel> products;
  final bool hasMore;
  ProductSuccess(this.products, this.hasMore);
}
class ProductFailure extends HometState {
  final String error;
  ProductFailure(this.error);
}
