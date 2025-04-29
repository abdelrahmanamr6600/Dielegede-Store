import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/profile/data/model/model.dart';
import 'package:dio/dio.dart';

class Profilerepo {
  final ApisService _apisService;

  Profilerepo(this._apisService);

  Future<Either<Failure, UpdateProfileModel>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _apisService.put(EndPoints.editProfile, {
        'name': name,
        'email': email,
        'phone': phone,
        'current_password': currentPassword,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      final model = UpdateProfileModel.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
