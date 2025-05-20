
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

class WishlistResponse {
  final bool success;
  final bool isAuthenticated;
  final WishlistDataPagination data;

  WishlistResponse({
    required this.success,
    required this.isAuthenticated,
    required this.data,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      success: json['success'],
      isAuthenticated: json['is_authenticated'],
      data: WishlistDataPagination.fromJson(json['data']),
    );
  }
}

class WishlistDataPagination {
  final int currentPage;
  final List<WishlistItem> items;
  final int lastPage;
  final int total;
  final String firstPageUrl;
  final String lastPageUrl;
  // final List<Link> links;

  WishlistDataPagination({
    required this.currentPage,
    required this.items,
    required this.lastPage,
    required this.total,
    required this.firstPageUrl,
    required this.lastPageUrl,
    // required this.links,
  });

  factory WishlistDataPagination.fromJson(Map<String, dynamic> json) {
    return WishlistDataPagination(
      currentPage: json['current_page'],
      items: List<WishlistItem>.from(
        json['data'].map((item) => WishlistItem.fromJson(item)),
      ),
      lastPage: json['last_page'],
      total: json['total'],
      firstPageUrl: json['first_page_url'],
      lastPageUrl: json['last_page_url'],
      // links: List<Link>.from(json['links'].map((item) => Link.fromJson(item))),
    );
  }
}

class WishlistItem {
  final int id;
  final int userId;
  final int productId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProductModel product;

  WishlistItem({
    required this.id,
    required this.userId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      product: ProductModel.fromJson(json['product']),
    );
  }
}

class WishListProductModel {
  final int id;
  final String name;
  final String description;
  final int storeId;
  final int categoryId;
  final double price;
  final double? discountPrice;
  final List<String> sizes;
  final List<String> colors;
  final List<String> images;
  final String status;
  final bool isFeatured;
  final int stockQuantity;
  final double rating;
  final int totalReviews;
  final DateTime createdAt;
  final DateTime updatedAt;

  WishListProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.storeId,
    required this.categoryId,
    required this.price,
    required this.discountPrice,
    required this.sizes,
    required this.colors,
    required this.images,
    required this.status,
    required this.isFeatured,
    required this.stockQuantity,
    required this.rating,
    required this.totalReviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WishListProductModel.fromJson(Map<String, dynamic> json) {
    return WishListProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null ? (json['discount_price'] as num).toDouble() : null,
      sizes: List<String>.from(json['sizes']),
      colors: List<String>.from(json['colors']),
      images: List<String>.from(json['images']),
      status: json['status'],
      isFeatured: json['is_featured'],
      stockQuantity: json['stock_quantity'],
      rating: (json['rating'] as num).toDouble(),
      totalReviews: json['total_reviews'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
