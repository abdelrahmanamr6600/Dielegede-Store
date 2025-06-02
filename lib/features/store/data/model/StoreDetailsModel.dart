// import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

import 'package:dielegende_store/features/home/data/model/ProductModel.dart';

class StoreDetailsModel {
  final int? id;
  final String? name;
  final int? ownerId;
  final String? description;
  final String? address;
  final String? phone;
  final String? ownerPhone;
  final double? latitude;
  final double? longitude;
  final String? logo;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<StoreCategoryModel>? categories;
  final OwnerModel? owner;
  final List<ProductModel>? products;
  final List<FollowerModel>? followers;

  StoreDetailsModel({
    this.id,
    this.name,
    this.ownerId,
    this.description,
    this.address,
    this.phone,
    this.ownerPhone,
    this.latitude,
    this.longitude,
    this.logo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.categories,
    this.owner,
    this.products,
    this.followers,
  });

  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
    return StoreDetailsModel(
      id: json['id'],
      name: json['name'],
      ownerId: json['owner_id'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      ownerPhone: json['owner_phone'],
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
      logo: json['logo'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => StoreCategoryModel.fromJson(e))
              .toList()
          : null,
      owner: json['owner'] != null ? OwnerModel.fromJson(json['owner']) : null,
      products: json['products'] != null
          ? (json['products'] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList()
          : null,
      followers: json['followers'] != null
          ? (json['followers'] as List)
              .map((e) => FollowerModel.fromJson(e))
              .toList()
          : null,
    );
  }
}

class StoreCategoryModel {
  final int? id;
  final String? name;
  final String? description;
  final String? status;

  StoreCategoryModel({
    this.id,
    this.name,
    this.description,
    this.status,
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
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? birthDate;
  final String? phone;
  final String? gender;
  final String? role;

  OwnerModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.birthDate,
    this.phone,
    this.gender,
    this.role,
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
  final int? id;
  final String? name;
  final String? description;
  final int? storeId;
  final int? categoryId;
  final double? price;
  final double? discountPrice;
  final List<String>? sizes;
  final List<String>? colors;
  final List<String>? images;
  final String? status;
  final bool? isFeatured;
  final int? stockQuantity;
  final double? rating;
  final int? totalReviews;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StoreProductModel({
    this.id,
    this.name,
    this.description,
    this.storeId,
    this.categoryId,
    this.price,
    this.discountPrice,
    this.sizes,
    this.colors,
    this.images,
    this.status,
    this.isFeatured,
    this.stockQuantity,
    this.rating,
    this.totalReviews,
    this.createdAt,
    this.updatedAt,
  });

  factory StoreProductModel.fromJson(Map<String, dynamic> json) {
    return StoreProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      storeId: json['store_id'],
      categoryId: json['category_id'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,
      sizes: json['sizes'] != null ? List<String>.from(json['sizes']) : null,
      colors: json['colors'] != null ? List<String>.from(json['colors']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      status: json['status'],
      isFeatured: json['is_featured'],
      stockQuantity: json['stock_quantity'],
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      totalReviews: json['total_reviews'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class FollowerModel {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? birthDate;
  final String? phone;
  final String? gender;
  final String? role;
  final PivotModel? pivot;

  FollowerModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.birthDate,
    this.phone,
    this.gender,
    this.role,
    this.pivot,
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
      pivot: json['pivot'] != null ? PivotModel.fromJson(json['pivot']) : null,
    );
  }
}

class PivotModel {
  final int? userId;
  final int? storeId;

  PivotModel({
    this.userId,
    this.storeId,
  });

  factory PivotModel.fromJson(Map<String, dynamic> json) {
    return PivotModel(
      userId: json['user_id'],
      storeId: json['store_id'],
    );
  }
}


// class StoreDetailsModel {
//   final bool success;
//   final StoreDetailsData data;

//   StoreDetailsModel({required this.success, required this.data});

//   factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
//     return StoreDetailsModel(
//       success: json['success'],
//       data: StoreDetailsData.fromJson(json['data']),
//     );
//   }
// }

// class StoreDetailsData {
//   final int id;
//   final String name;
//   final int ownerId;
//   final String description;
//   final String address;
//   final String phone;
//   final String ownerPhone;
//   final double latitude;
//   final double longitude;
//   final String logo;
//   final String status;
//   final String createdAt;
//   final String updatedAt;
//   final List<CategoryDetails> categories;
//   final OwnerDetails owner;
//   final List<ProductDetails> products;

//   StoreDetailsData({
//     required this.id,
//     required this.name,
//     required this.ownerId,
//     required this.description,
//     required this.address,
//     required this.phone,
//     required this.ownerPhone,
//     required this.latitude,
//     required this.longitude,
//     required this.logo,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.categories,
//     required this.owner,
//     required this.products,
//   });

//   factory StoreDetailsData.fromJson(Map<String, dynamic> json) {
//     return StoreDetailsData(
//       id: json['id'],
//       name: json['name'],
//       ownerId: json['owner_id'],
//       description: json['description'],
//       address: json['address'],
//       phone: json['phone'],
//       ownerPhone: json['owner_phone'],
//       latitude: (json['latitude'] as num).toDouble(),
//       longitude: (json['longitude'] as num).toDouble(),
//       logo: json['logo'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       categories: (json['categories'] as List)
//           .map((e) => CategoryDetails.fromJson(e))
//           .toList(),
//       owner: OwnerDetails.fromJson(json['owner']),
//       products: (json['products'] as List)
//           .map((e) => ProductDetails.fromJson(e))
//           .toList(),
//     );
//   }
// }

// class CategoryDetails {
//   final int id;
//   final String name;
//   final String description;
//   final String status;
//   final String createdAt;
//   final String updatedAt;

//   CategoryDetails({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory CategoryDetails.fromJson(Map<String, dynamic> json) {
//     return CategoryDetails(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

// class OwnerDetails {
//   final int id;
//   final String name;
//   final String email;
//   final String? emailVerifiedAt;
//   final String birthDate;
//   final String phone;
//   final String gender;
//   final String role;
//   final String createdAt;
//   final String updatedAt;

//   OwnerDetails({
//     required this.id,
//     required this.name,
//     required this.email,
//     this.emailVerifiedAt,
//     required this.birthDate,
//     required this.phone,
//     required this.gender,
//     required this.role,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory OwnerDetails.fromJson(Map<String, dynamic> json) {
//     return OwnerDetails(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       emailVerifiedAt: json['email_verified_at'],
//       birthDate: json['birth_date'],
//       phone: json['phone'],
//       gender: json['gender'],
//       role: json['role'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

// class ProductDetails {
//   final int id;
//   final String name;
//   final String description;
//   final int storeId;
//   final int categoryId;
//   final double price;
//   final double? discountPrice;
//   final List<String> sizes;
//   final List<String> colors;
//   final List<String> images;
//   final String status;
//   final bool isFeatured;
//   final int stockQuantity;
//   final double rating;
//   final int totalReviews;
//   final String createdAt;
//   final String updatedAt;

//   ProductDetails({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.storeId,
//     required this.categoryId,
//     required this.price,
//     this.discountPrice,
//     required this.sizes,
//     required this.colors,
//     required this.images,
//     required this.status,
//     required this.isFeatured,
//     required this.stockQuantity,
//     required this.rating,
//     required this.totalReviews,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ProductDetails.fromJson(Map<String, dynamic> json) {
//     return ProductDetails(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       storeId: json['store_id'],
//       categoryId: json['category_id'],
//       price: (json['price'] as num).toDouble(),
//       discountPrice: json['discount_price'] != null
//           ? (json['discount_price'] as num).toDouble()
//           : null,
//       sizes: List<String>.from(json['sizes']),
//       colors: List<String>.from(json['colors']),
//       images: List<String>.from(json['images']),
//       status: json['status'],
//       isFeatured: json['is_featured'],
//       stockQuantity: json['stock_quantity'],
//       rating: (json['rating'] as num).toDouble(),
//       totalReviews: json['total_reviews'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }

