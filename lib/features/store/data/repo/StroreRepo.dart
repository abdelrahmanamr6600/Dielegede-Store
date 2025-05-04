import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/features/store/data/model/StoreModel.dart';
import 'package:dio/dio.dart';

class StoreProductsRepo {
  final ApisService _apiService;
  StoreProductsRepo(this._apiService);
  Future<Either<Failure, StoreProductsModel>> getStoreProducts(
      int storeId) async {
    try {
      final response = await _apiService.get('/stores/$storeId/products');

      final products = StoreProductsModel.fromJson(response);

      return Right(products);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(ServicesFailure(e.toString()));
    }
  }


}
