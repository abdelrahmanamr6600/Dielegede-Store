import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/register/data/model/RegisterModel.dart';
import 'package:dio/dio.dart';

class RegisterRepo {
  final ApisService _apisService;

  RegisterRepo(this._apisService);

 Future<Either<Failure, RegisterResponseModel>> registerUser(Map<String, dynamic> data) async {
    try {
      final response = await _apisService.post( EndPoints.register , data);
      final model = RegisterResponseModel.fromJson(response);
      return Right(model);
    }  on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
