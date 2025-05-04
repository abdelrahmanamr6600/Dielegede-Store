import 'dart:convert';

import 'package:dielegende_store/features/home/data/model/ProductModel.dart';


class StoreProductsModel {
  final int currentPage;
  final List<ProductModelStore> products;
  final int lastPage;
  final int total;
  final String firstPageUrl;
  final String? nextPageUrl;
  final String? prevPageUrl;

  StoreProductsModel({
    required this.currentPage,
    required this.products,
    required this.lastPage,
    required this.total,
    required this.firstPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory StoreProductsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return StoreProductsModel(
      currentPage: data['current_page'],
      products: List<ProductModelStore>.from(data['data'].map((item) => ProductModelStore.fromJson(item))),
      lastPage: data['last_page'],
      total: data['total'],
      firstPageUrl: data['first_page_url'],
      nextPageUrl: data['next_page_url'],
      prevPageUrl: data['prev_page_url'],
    );
  }
}


class ProductModelStore {
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
  final String createdAt;
  final String updatedAt;

  ProductModelStore({
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
  });

  factory ProductModelStore.fromJson(Map<String, dynamic> json) {
    return ProductModelStore(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      price: json['price'].toDouble(),
      discountPrice: json['discount_price'] != null ? json['discount_price'].toDouble() : null,
      sizes: List<String>.from(jsonDecode(json['sizes'])),
      colors: List<String>.from(jsonDecode(json['colors'])),
      images: List<String>.from(jsonDecode(json['images'])),
      status: json['status'],
      isFeatured: json['is_featured'],
      stockQuantity: json['stock_quantity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
