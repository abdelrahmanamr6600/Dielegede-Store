class StoreModel {
  final int id;
  final String name;
  final String description;
  final String address;
  final String phone;
  final String ownerPhone;
  final double latitude;
  final double longitude;
  final String logo;
  final int isActive;

  StoreModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.phone,
    required this.ownerPhone,
    required this.latitude,
    required this.longitude,
    required this.logo,
    required this.isActive,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      ownerPhone: json['owner_phone'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      logo: json['logo'],
      isActive: json['is_active'],
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final int isActive;

  CategoryModel({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      isActive: json['is_active'],
    );
  }
}
