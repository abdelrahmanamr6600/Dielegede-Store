import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/store/data/model/AllStoresModel.dart';
import 'package:dielegende_store/features/store/data/model/StoreDetailsModel.dart';
import 'package:dielegende_store/features/store/data/model/StoreProductModel.dart';
import 'package:dio/dio.dart';

class StoreRepo {
  final ApisService _apiService;
  StoreRepo(this._apiService);

  Future<Either<Failure, StoreProductsResponse>> getStoreProducts(
      int storeId) async {
    try {
      final response = await _apiService.get('/stores/$storeId/products');
      final products = StoreProductsResponse.fromJson(response);

      return Right(products);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(ServicesFailure(e.toString()));
    }
  }

  Future<Either<Failure, AllStoresModel>> getAllStores() async {
    try {
      final response = await _apiService.get(EndPoints.allStores);
      final products = AllStoresModel.fromJson(response);
      return Right(products);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(ServicesFailure(e.toString()));
    }
  }

  Future<Either<Failure, StoreDetailsModel>> getStoreDtetails(
      int storeId) async {
    try {
      final response = await _apiService.get('/stores/$storeId');
      final products =
          StoreDetailsModel.fromJson(response['data']);
      print(response.toString());
      print(products);

      return Right(products);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(ServicesFailure(e.toString()));
    }
  }
}
