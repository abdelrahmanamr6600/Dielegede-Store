import 'dart:convert';

import 'package:dielegende_store/features/home/data/model/StoreModel.dart';

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
  final String status;
  final bool isFeatured;
  final int stockQuantity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final StoreModel store;
  final CategoryModel category;

  ProductModel({
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
    required this.createdAt,
    required this.updatedAt,
    required this.store,
    required this.category,
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
      sizes:
          List<String>.from(jsonDecode(json['sizes']).map((e) => e.toString())),
      colors: List<String>.from(
          jsonDecode(json['colors']).map((e) => e.toString())),
      images: List<String>.from(
          jsonDecode(json['images']).map((e) => e.toString())),
      status: json['status'],
      isFeatured: json['is_featured'],
      stockQuantity: json['stock_quantity'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      store: StoreModel.fromJson(json['store']),
      category: CategoryModel.fromJson(json['category']),
    );
  }
}
