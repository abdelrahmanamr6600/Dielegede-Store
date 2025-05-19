import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

class SearchProductsResponse {
  final bool success;
  final PaginatedSearchData data;

  SearchProductsResponse({
    required this.success,
    required this.data,
  });

  factory SearchProductsResponse.fromJson(Map<String, dynamic> json) {
    return SearchProductsResponse(
      success: json['success'],
      data: PaginatedSearchData.fromJson(json['data']),
    );
  }
}

class PaginatedSearchData {
  final int currentPage;
  final List<ProductModel> products;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final int total;

  PaginatedSearchData({
    required this.currentPage,
    required this.products,
    required this.nextPageUrl,
    required this.prevPageUrl,
    required this.total,
  });

  factory PaginatedSearchData.fromJson(Map<String, dynamic> json) {
    return PaginatedSearchData(
      currentPage: json['current_page'],
      products: List<ProductModel>.from(
        (json['data'] as List).map((e) => ProductModel.fromJson(e)),
      ),
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
      total: json['total'],
    );
  }
}
