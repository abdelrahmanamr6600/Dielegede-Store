import 'dart:convert';

import 'package:dielegende_store/features/home/data/model/PaginatedProductModel.dart';
import 'package:dielegende_store/features/home/data/model/StoreModel.dart';

class ProductResponse {
  final bool success;
  final ProductDataPagination data;

  ProductResponse({required this.success, required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      success: json['success'],
      data: ProductDataPagination.fromJson(json['data']),
    );
  }
}

class ProductModel {
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
  final String? status;
  final bool isFeatured;
  final int stockQuantity;
  final double rating;
  final int totalReviews;
  final DateTime createdAt;
  final DateTime updatedAt;
  final StoreModel? store;
  final CategoryModel? category;

  ProductModel({
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
    this.store,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,
      sizes: List<String>.from(json['sizes']),
      colors: List<String>.from(json['colors']),
      images: List<String>.from(json['images']),
      status: json['status'], // or json['status'] ?? 'inactive'
      isFeatured: json['is_featured'],
      stockQuantity: json['stock_quantity'],
      rating: (json['rating'] as num).toDouble(),
      totalReviews: json['total_reviews'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      store: json['store'] != null ? StoreModel.fromJson(json['store']) : null,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String description;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
