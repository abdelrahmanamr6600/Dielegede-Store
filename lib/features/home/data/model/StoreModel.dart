class StoreModel {
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
  final DateTime createdAt;
  final DateTime updatedAt;

  StoreModel({
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
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
