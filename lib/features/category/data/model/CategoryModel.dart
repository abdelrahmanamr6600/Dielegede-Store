import 'dart:convert';

class HomeCategoryModel {
  final bool success;
  final CategoryData data;

  HomeCategoryModel({required this.success, required this.data});

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      success: json['success'],
      data: CategoryData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class CategoryData {
  final int currentPage;
  final List<Category> categories;
  final String firstPageUrl;
  final String lastPageUrl;
  final int total;

  CategoryData({
    required this.currentPage,
    required this.categories,
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.total,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      currentPage: json['current_page'],
      categories: List<Category>.from(
        json['data'].map((item) => Category.fromJson(item)),
      ),
      firstPageUrl: json['first_page_url'],
      lastPageUrl: json['last_page_url'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': categories.map((e) => e.toJson()).toList(),
      'first_page_url': firstPageUrl,
      'last_page_url': lastPageUrl,
      'total': total,
    };
  }
}

class Category {
  final int id;
  final String name;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final int storesCount;

  Category({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.storesCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      isActive: json['is_active'] == 1,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      storesCount: json['stores_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_active': isActive ? 1 : 0,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'stores_count': storesCount,
    };
  }
}
