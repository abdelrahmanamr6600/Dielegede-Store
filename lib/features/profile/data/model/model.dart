class UpdateProfileModel {
  final String status;
  final String message;
  final UserData data;

  UpdateProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: json['status'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final DateTime? birthDate;
  final String? gender;

  UserData({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.birthDate,
    this.gender,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      birthDate: json['birth_date'] != null
          ? DateTime.tryParse(json['birth_date'])
          : null,
      gender: json['gender'] as String?,
    );
  }
}
