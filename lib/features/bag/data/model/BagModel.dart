class BagResponse {
  final bool success;
  final BagData data;

  BagResponse({
    required this.success,
    required this.data,
  });

  factory BagResponse.fromJson(Map<String, dynamic> json) {
    return BagResponse(
      success: json['success'],
      data: BagData.fromJson(json['data']),
    );
  }
}

class BagData {
  final List<BagItem> bagItems;
  final int totalItems;
  final double totalPrice;

  BagData({
    required this.bagItems,
    required this.totalItems,
    required this.totalPrice,
  });

  factory BagData.fromJson(Map<String, dynamic> json) {
    return BagData(
      bagItems: (json['bag_items'] as List)
          .map((item) => BagItem.fromJson(item))
          .toList(),
      totalItems: json['total_items'],
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }
}

class BagItem {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final SelectedOptions selectedOptions;
  final String status;
  final DateTime expiresAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BagProduct product;

  BagItem({
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

  factory BagItem.fromJson(Map<String, dynamic> json) {
    return BagItem(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      selectedOptions: SelectedOptions.fromJson(json['selected_options']),
      status: json['status'],
      expiresAt: DateTime.parse(json['expires_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      product: BagProduct.fromJson(json['product']),
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

class BagProduct {
  final int id;
  final String name;
  final double price;
  final List<String> images;
  final int stockQuantity;

  BagProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.stockQuantity,
  });

  factory BagProduct.fromJson(Map<String, dynamic> json) {
    return BagProduct(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      images: List<String>.from(json['images']),
      stockQuantity: json['stock_quantity'],
    );
  }
}
