class StoreDetailsModel {
  final int id;
  final String name;
  final int? ownerId;
  final String description;
  final String address;
  final String phone;
  final String ownerPhone;
  final double latitude;
  final double longitude;
  final String logo;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<StoreCategoryModel> categories;
  final OwnerModel owner;
  final List<StoreProductModel> products;
  final List<FollowerModel> followers;

  StoreDetailsModel({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.description,
    required this.address,
    required this.phone,
    required this.ownerPhone,
    required this.latitude,
    required this.longitude,
    required this.logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
    required this.owner,
    required this.products,
    required this.followers,
  });

  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
    return StoreDetailsModel(
      id: json['id'],
      name: json['name'],
      ownerId: json['owner_id'] ?? 0,
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      ownerPhone: json['owner_phone'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      logo: json['logo'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      categories: (json['categories'] as List)
          .map((e) => StoreCategoryModel.fromJson(e))
          .toList(),
      owner: OwnerModel.fromJson(json['owner']),
      products: (json['products'] as List)
          .map((e) => StoreProductModel.fromJson(e))
          .toList(),
      followers: (json['followers'] as List)
          .map((e) => FollowerModel.fromJson(e))
          .toList(),
    );
  }
}

class StoreCategoryModel {
  final int id;
  final String name;
  final String description;
  final String status;

  StoreCategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  factory StoreCategoryModel.fromJson(Map<String, dynamic> json) {
    return StoreCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
    );
  }
}

class OwnerModel {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String birthDate;
  final String phone;
  final String gender;
  final String role;

  OwnerModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.birthDate,
    required this.phone,
    required this.gender,
    required this.role,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      birthDate: json['birth_date'],
      phone: json['phone'],
      gender: json['gender'],
      role: json['role'],
    );
  }
}

class StoreProductModel {
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

  StoreProductModel({
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

  factory StoreProductModel.fromJson(Map<String, dynamic> json) {
    return StoreProductModel(
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

class FollowerModel {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String birthDate;
  final String phone;
  final String gender;
  final String role;

  FollowerModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.birthDate,
    required this.phone,
    required this.gender,
    required this.role,
  });

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      birthDate: json['birth_date'],
      phone: json['phone'],
      gender: json['gender'],
      role: json['role'],
    );
  }
}
