import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final ApisService _apisService;
  HomeRepo(this._apisService);
  Future<Either<Failure, List<ProductModel>>> fetchProduct(
      {int page = 1}) async {
    try {
      final response = await _apisService
          .get('/api/v1/products', query: {'page': page, 'per_page': 10});
      List<ProductModel> products = (response['data']['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      Println('error: ${response.toString()}');

      return Right(products);
    } on DioException catch (e) {
      Println('error: ${e.response?.data}');
      Println('error: ${e}');

      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
