import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/profile/data/model/ProfileModel.dart';
import 'package:dielegende_store/features/profile/data/model/model.dart';
import 'package:dio/dio.dart';

class Profilerepo {
  final ApisService _apisService;

  Profilerepo(this._apisService);

  Future<Either<Failure, ProfileResponse>> fetchProfile() async {
    try {
      final response = await _apisService.get(EndPoints.profile);
      print(response);
      final model = ProfileResponse.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }

  Future<Either<Failure, UpdateProfileModel>> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? currentPassword,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      final Map<String, dynamic> data = {};

      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (phone != null) data['phone'] = phone;
      if (currentPassword != null) data['current_password'] = currentPassword;
      if (password != null) data['password'] = password;
      if (passwordConfirmation != null) {
        data['password_confirmation'] = passwordConfirmation;
      }

      final response = await _apisService.put(EndPoints.editProfile, data);
      final model = UpdateProfileModel.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }

  Future<Either<Failure, String>> logout() async {
  try {
    final response = await _apisService.post(EndPoints.logout, {});
    return Right(response['message'] ?? 'Logged out successfully');
  } on DioException catch (e) {
    return Left(ServicesFailure.fromDioError(e));
  }
}


}
