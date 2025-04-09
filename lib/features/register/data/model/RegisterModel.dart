class RegisterResponseModel {
  final String status;
  final String message;
  final RegisterUser user;
  final String token;

  RegisterResponseModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      message: json['message'],
      user: RegisterUser.fromJson(json['data']['user']),
      token: json['data']['token'],
    );
  }
}

class RegisterUser {
  final int id;
  final String name;
  final String email;
  final String role;

  RegisterUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
