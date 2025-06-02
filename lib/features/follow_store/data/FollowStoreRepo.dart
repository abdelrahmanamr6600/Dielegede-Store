import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/follow_store/data/FollowedStoresModel.dart';
import 'package:dielegende_store/features/wish_list/data/model/WishListModel.dart';
import 'package:dio/dio.dart';

class FollowStoreRepo {
  final ApisService _apisService;

  FollowStoreRepo(this._apisService);
  Future<void> followStore(int storeId) async {
    try {
      await _apisService.post("${EndPoints.followStores}$storeId", {});
    } on DioException catch (e) {
      throw ServicesFailure.fromDioError(e);
    }
  }

  Future<void> unFollowStore(int storeId) async {
    try {
      await _apisService.post("${EndPoints.unFollowStores}$storeId", {});
    } on DioException catch (e) {
      throw ServicesFailure.fromDioError(e);
    }
  }

  Future<Either<Failure, FollowedStoresResponse>> getFollowedStores() async {
    try {
      final response = await _apisService.get(EndPoints.allFollowedStores);
      return Right(FollowedStoresResponse.fromJson(response));
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }

  Future<List<int>> getFollowedStoresIds() async {
    try {
      final response = await _apisService.get(EndPoints.allFollowedStores);
      final data = response["data"]["data"] as List;

      return data
          .map((item) => item["id"])
          .where((id) => id != null && id is int)
          .cast<int>()
          .toList();
    } on DioException catch (e) {
      throw ServicesFailure.fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }
}
