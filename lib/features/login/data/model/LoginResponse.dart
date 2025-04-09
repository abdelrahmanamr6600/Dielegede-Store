class LoginResponseModel {
  final String status;
  final String message;
  final LoginUser user;
  final String token;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'],
      message: json['message'],
      user: LoginUser.fromJson(json['data']['user']),
      token: json['data']['token'],
    );
  }
}

class LoginUser {
  final int id;
  final String name;
  final String email;
  final String role;

  LoginUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }
}
