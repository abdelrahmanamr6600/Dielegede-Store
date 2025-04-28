import 'dart:convert';

class FavoriteProductsResponse {
  final bool success;
  final FavoriteProductsData data;
  final bool isAuthenticated;

  FavoriteProductsResponse({
    required this.success,
    required this.data,
    required this.isAuthenticated,
  });

  factory FavoriteProductsResponse.fromJson(Map<String, dynamic> json) {
    return FavoriteProductsResponse(
      success: json['success'],
      data: FavoriteProductsData.fromJson(json['data']),
      isAuthenticated: json['is_authenticated'],
    );
  }
}
class FavoriteProductsData {
  final int currentPage;
  final List<FavoriteProduct> products;
  final int total;

  FavoriteProductsData({
    required this.currentPage,
    required this.products,
    required this.total,
  });

  factory FavoriteProductsData.fromJson(Map<String, dynamic> json) {
    return FavoriteProductsData(
      currentPage: json['current_page'],
      products: List<FavoriteProduct>.from(
        (json['data'] as List<dynamic>).map(
          (e) => FavoriteProduct.fromJson(e),
        ),
      ),
      total: json['total'],
    );
  }
}

class FavoriteProduct {
  final int id;
  final int userId;
  final int productId;
  final Product? product;

  FavoriteProduct({
    required this.id,
    required this.userId,
    required this.productId,
    this.product,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final List<String> sizes;
  final List<String> colors;
  final List<String> images;
  final int storeId; // تم إضافة هذا الحقل
  final int categoryId; // تم إضافة هذا الحقل
  final double price; // تم إضافة هذا الحقل
  final double? discountPrice; // تم إضافة هذا الحقل (بـ null safety)
  final String status; // تم إضافة هذا الحقل
  final bool isFeatured; // تم إضافة هذا الحقل
  final int stockQuantity; // تم إضافة هذا الحقل

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.sizes,
    required this.colors,
    required this.images,
    required this.storeId,
    required this.categoryId,
    required this.price,
    this.discountPrice,
    required this.status,
    required this.isFeatured,
    required this.stockQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      sizes: List<String>.from(jsonDecode(json['sizes'] ?? '[]')),
      colors: List<String>.from(jsonDecode(json['colors'] ?? '[]')),
      images: List<String>.from(jsonDecode(json['images'] ?? '[]')),
      storeId: json['store_id'], // إضافة
      categoryId: json['category_id'], // إضافة
      price: json['price'].toDouble(), // إضافة
      discountPrice: json['discount_price'] != null ? json['discount_price'].toDouble() : null, // إضافة
      status: json['status'], // إضافة
      isFeatured: json['is_featured'], // إضافة
      stockQuantity: json['stock_quantity'], // إضافة
    );
  }
}
