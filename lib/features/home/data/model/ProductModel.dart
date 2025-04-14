import 'dart:convert';
import 'package:dielegende_store/features/home/data/model/StoreModel.dart';

class ProductModel {
  final int id;
  final String name;
  final int storeId;
  final int categoryId;
  final double price;
  final List<String> sizes;
  final List<String> colors;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final StoreModel store;
  final CategoryModel category;

  ProductModel({
    required this.id,
    required this.name,
    required this.storeId,
    required this.categoryId,
    required this.price,
    required this.sizes,
    required this.colors,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.store,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      price: (json['price'] as num).toDouble(),
      sizes: List<String>.from(jsonDecode(json['sizes'])),
      colors: List<String>.from(jsonDecode(json['colors'])),
      images: List<String>.from(jsonDecode(json['images'])),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      store: StoreModel.fromJson(json['store']),
      category: CategoryModel.fromJson(json['category']),
    );
  }
}
