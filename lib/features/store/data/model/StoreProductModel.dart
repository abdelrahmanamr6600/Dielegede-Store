import 'dart:convert';

import 'package:dielegende_store/features/home/data/model/ProductModel.dart';


class StoreProductsResponse {
  final bool success;
  final StorePaginatedProducts data;

  StoreProductsResponse({
    required this.success,
    required this.data,
  });

  factory StoreProductsResponse.fromJson(Map<String, dynamic> json) {
    return StoreProductsResponse(
      success: json['success'],
      data: StorePaginatedProducts.fromJson(json['data']),
    );
  }
}

class StorePaginatedProducts {
  final int currentPage;
  final List<StoreProductsModel> data;

  StorePaginatedProducts({
    required this.currentPage,
    required this.data,
  });

  factory StorePaginatedProducts.fromJson(Map<String, dynamic> json) {
    return StorePaginatedProducts(
      currentPage: json['current_page'],
      data: List<StoreProductsModel>.from(
        json['data'].map((item) => StoreProductsModel.fromJson(item)),
      ),
    );
  }
}

class StoreProductsModel {
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

  StoreProductsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.storeId,
    required this.categoryId,
    required this.price,
    this.discountPrice,
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

  factory StoreProductsModel.fromJson(Map<String, dynamic> json) {
    return StoreProductsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num?)?.toDouble()
          : null,
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
