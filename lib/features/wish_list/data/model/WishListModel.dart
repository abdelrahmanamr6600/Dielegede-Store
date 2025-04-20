class WishListmodel { 
  WishListmodel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory WishListmodel.fromJson(Map<String, dynamic> json) => WishListmodel(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}