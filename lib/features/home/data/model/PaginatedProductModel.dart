import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

class PaginatedProductResponse {
  final int currentPage;
  final List<ProductModel> products;
  final int lastPage;
  final String? nextPageUrl;

  PaginatedProductResponse({
    required this.currentPage,
    required this.products,
    required this.lastPage,
    required this.nextPageUrl,
  });

  factory PaginatedProductResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedProductResponse(
      currentPage: json['current_page'],
      products: List<ProductModel>.from(
        json['data'].map((item) => ProductModel.fromJson(item)),
      ),
      lastPage: json['last_page'],
      nextPageUrl: json['next_page_url'],
    );
  }
}
