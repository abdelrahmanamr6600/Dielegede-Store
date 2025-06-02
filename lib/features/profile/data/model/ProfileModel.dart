class ProfileResponse {
  final bool success;
  final ProfileData data;

  ProfileResponse({required this.success, required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: json['success'],
      data: ProfileData.fromJson(json['data']),
    );
  }
}

class ProfileData {
  final User user;
  final List<Favorite> favorites;
  final int favoritesCount;

  ProfileData({
    required this.user,
    required this.favorites,
    required this.favoritesCount,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      user: User.fromJson(json['user'] ?? {}),
      favorites: (json['favorites'] as List<dynamic>? ?? [])
          .map((e) => Favorite.fromJson(e))
          .toList(),
      favoritesCount: json['favorites_count'] ?? 0,
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final DateTime birthDate;
  final String gender;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.gender,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      birthDate: DateTime.tryParse(json['birth_date'] ?? '') ?? DateTime(1970),
      gender: json['gender'] ?? '',
      role: json['role'] ?? '',
    );
  }
}

class Favorite {
  final int id;
  final Product product;
  final DateTime addedAt;

  Favorite({
    required this.id,
    required this.product,
    required this.addedAt,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      product: Product.fromJson(json['product']),
      addedAt: DateTime.parse(json['added_at']),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final Store store;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.store,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      store: Store.fromJson(json['store']),
    );
  }
}

class Store {
  final int id;
  final String name;

  Store({
    required this.id,
    required this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
    );
  }
}
