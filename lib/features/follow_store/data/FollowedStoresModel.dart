class FollowedStoresResponse {
  final bool success;
  final FollowedStoresData data;

  FollowedStoresResponse({required this.success, required this.data});

  factory FollowedStoresResponse.fromJson(Map<String, dynamic> json) {
    return FollowedStoresResponse(
      success: json['success'],
      data: FollowedStoresData.fromJson(json['data']),
    );
  }
}

class FollowedStoresData {
  final int currentPage;
  final List<Store> data;
  final String? firstPageUrl;
  final int from;
  final int lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  FollowedStoresData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory FollowedStoresData.fromJson(Map<String, dynamic> json) {
    return FollowedStoresData(
      currentPage: json['current_page'],
      data: (json['data'] as List).map((e) => Store.fromJson(e)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
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
  final Pivot pivot;

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
    required this.pivot,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      ownerId: json['owner_id'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      ownerPhone: json['owner_phone'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      logo: json['logo'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot {
  final int userId;
  final int storeId;

  Pivot({required this.userId, required this.storeId});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'],
      storeId: json['store_id'],
    );
  }
}

