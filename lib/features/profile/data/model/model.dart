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
  final String name;
  final String email;
  final String phone;
  final DateTime birthDate;
  final String gender;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.gender,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      birthDate: DateTime.parse(json['birth_date']),
      gender: json['gender'],
    );
  }
}
