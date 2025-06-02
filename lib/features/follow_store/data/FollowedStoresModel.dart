class FollowedStoresResponse {
  final bool success;
  final FollowedStoresData? data;

  FollowedStoresResponse({
    required this.success,
    this.data,
  });

  factory FollowedStoresResponse.fromJson(Map<String, dynamic> json) {
    return FollowedStoresResponse(
      success: json['success'],
      data: json['data'] != null
          ? FollowedStoresData.fromJson(json['data'])
          : null,
    );
  }
}

class FollowedStoresData {
  final int currentPage;
  final List<Store> data;
  final String? firstPageUrl;
  final int? from;
  final int lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  FollowedStoresData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    this.to,
    required this.total,
  });

  factory FollowedStoresData.fromJson(Map<String, dynamic> json) {
    return FollowedStoresData(
      currentPage: json['current_page'] ?? 0,
      data: (json['data'] as List?)
              ?.map((e) => Store.fromJson(e))
              .toList() ??
          [],
      firstPageUrl: json['first_page_url'],
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 0,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class Store {
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
  final Pivot? pivot;

  Store({
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
    this.pivot,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      ownerId: json['owner_id'] ?? 0,
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      ownerPhone: json['owner_phone'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      logo: json['logo'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }
}

class Pivot {
  final int userId;
  final int storeId;

  Pivot({required this.userId, required this.storeId});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'] ?? 0,
      storeId: json['store_id'] ?? 0,
    );
  }
}

