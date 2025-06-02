import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

class CategoryProductsResponse {
  final bool success;
  final CategoryProductsData data;

  CategoryProductsResponse({required this.success, required this.data});

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) {
    return CategoryProductsResponse(
      success: json['success'],
      data: CategoryProductsData.fromJson(json['data']),
    );
  }
}

class CategoryProductsData {
  final Category category;
  final PaginatedProducts products;

  CategoryProductsData({required this.category, required this.products});

  factory CategoryProductsData.fromJson(Map<String, dynamic> json) {
    return CategoryProductsData(
      category: Category.fromJson(json['category']),
      products: PaginatedProducts.fromJson(json['products']),
    );
  }
}


class Category {
  final int id;
  final String name;
  final String description;
  final String status;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}


class PaginatedProducts {
  final int currentPage;
  final List<ProductModel> data;

  PaginatedProducts({required this.currentPage, required this.data});

  factory PaginatedProducts.fromJson(Map<String, dynamic> json) {
    return PaginatedProducts(
      currentPage: json['current_page'],
      data: List<ProductModel>.from(json['data'].map((item) => ProductModel.fromJson(item))),
    );
  }

  get price => null;
}

class Product {
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
  final String createdAt;
  final String updatedAt;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

