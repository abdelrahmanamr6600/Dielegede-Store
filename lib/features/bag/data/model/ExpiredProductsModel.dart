class ExpiredBagResponse {
  final bool success;
  final ExpiredBagData data;

  ExpiredBagResponse({
    required this.success,
    required this.data,
  });

  factory ExpiredBagResponse.fromJson(Map<String, dynamic> json) {
    return ExpiredBagResponse(
      success: json['success'],
      data: ExpiredBagData.fromJson(json['data']),
    );
  }
}

class ExpiredBagData {
  final List<ExpiredItem> expiredItems;
  final int totalExpiredItems;

  ExpiredBagData({
    required this.expiredItems,
    required this.totalExpiredItems,
  });

  factory ExpiredBagData.fromJson(Map<String, dynamic> json) {
    return ExpiredBagData(
      expiredItems: (json['expired_items'] as List)
          .map((e) => ExpiredItem.fromJson(e))
          .toList(),
      totalExpiredItems: json['total_expired_items'],
    );
  }
}


class ExpiredItem {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final SelectedOptions selectedOptions;
  final String status;
  final DateTime expiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ExpiredProduct product;

  ExpiredItem({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.selectedOptions,
    required this.status,
    required this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory ExpiredItem.fromJson(Map<String, dynamic> json) {
    return ExpiredItem(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      selectedOptions: SelectedOptions.fromJson(json['selected_options']),
      status: json['status'],
      expiresAt: DateTime.parse(json['expires_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      product: ExpiredProduct.fromJson(json['product']),
    );
  }
}


class SelectedOptions {
  final String color;
  final String size;

  SelectedOptions({
    required this.color,
    required this.size,
  });

  factory SelectedOptions.fromJson(Map<String, dynamic> json) {
    return SelectedOptions(
      color: json['color'],
      size: json['size'],
    );
  }
}


class ExpiredProduct {
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

  ExpiredProduct({
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

  factory ExpiredProduct.fromJson(Map<String, dynamic> json) {
    return ExpiredProduct(
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

