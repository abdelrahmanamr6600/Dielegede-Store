import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/login/data/model/LoginResponse.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final ApisService _apisService;

  LoginRepo(this._apisService);

 Future<Either<Failure, LoginResponseModel>> userLogin(Map<String, dynamic> data) async {
    try {
      final response = await _apisService.post( EndPoints.login , data);
      final model = LoginResponseModel.fromJson(response);
      return Right(model);
    }  on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
