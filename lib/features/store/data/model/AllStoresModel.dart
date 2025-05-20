class AllStoresModel {
  final bool success;
  final AllStoresData data;

  AllStoresModel({
    required this.success,
    required this.data,
  });
  
  factory AllStoresModel.fromJson(Map<String, dynamic> json) {
    return AllStoresModel(
      success: json['success'],
      data: AllStoresData.fromJson(json['data']),
    );
  }
}

class AllStoresData {
  final int currentPage;
  final List<AllStoreProductsModel> stores;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<PageLink> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  AllStoresData({
    required this.currentPage,
    required this.stores,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory AllStoresData.fromJson(Map<String, dynamic> json) {
    return AllStoresData(
      currentPage: json['current_page'],
      stores: List<AllStoreProductsModel>.from(json['data'].map((x) => AllStoreProductsModel.fromJson(x))),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: List<PageLink>.from(json['links'].map((x) => PageLink.fromJson(x))),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class AllStoreProductsModel {
  final int id;
  final String name;
  final int ownerId;
  final String description;
  final String address;
  final String phone;
  final String ownerPhone;
  final double latitude;
  final double longitude;
  final String logo;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int productsCount;
  final List<StoreCategoriesModel> categories;
  final OwnerModel owner;

  AllStoreProductsModel({
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
    required this.productsCount,
    required this.categories,
    required this.owner,
  });

  factory AllStoreProductsModel.fromJson(Map<String, dynamic> json) {
    return AllStoreProductsModel(
      id: json['id'],
      name: json['name'],
      ownerId: json['owner_id'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      ownerPhone: json['owner_phone'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      logo: json['logo'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      productsCount: json['products_count'],
      categories: List<StoreCategoriesModel>.from(json['categories'].map((x) => StoreCategoriesModel.fromJson(x))),
      owner: OwnerModel.fromJson(json['owner']),
    );
  }
}

class StoreCategoriesModel {
  final int id;
  final String name;
  final String description;
  final String status;
  final String createdAt;
  final String updatedAt;
  final PivotModel pivot;

  StoreCategoriesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory StoreCategoriesModel.fromJson(Map<String, dynamic> json) {
    return StoreCategoriesModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: PivotModel.fromJson(json['pivot']),
    );
  }
}

class PivotModel {
  final int storeId;
  final int categoryId;

  PivotModel({
    required this.storeId,
    required this.categoryId,
  });

  factory PivotModel.fromJson(Map<String, dynamic> json) {
    return PivotModel(
      storeId: json['store_id'],
      categoryId: json['category_id'],
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
  final String createdAt;
  final String updatedAt;

  OwnerModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.birthDate,
    required this.phone,
    required this.gender,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({
    required this.url,
    required this.label,
    required this.active,
  });

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
