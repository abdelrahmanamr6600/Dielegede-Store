import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

class ProductDataPagination {
  final int currentPage;
  final List<ProductModel> products;

  ProductDataPagination({required this.currentPage, required this.products});

  factory ProductDataPagination.fromJson(Map<String, dynamic> json) {
    return ProductDataPagination(
      currentPage: json['current_page'],
      products: List<ProductModel>.from(
        json['data'].map((item) => ProductModel.fromJson(item)),
      ),
    );
  }
}
