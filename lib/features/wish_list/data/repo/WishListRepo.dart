import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/wish_list/data/model/WishListModel.dart';
import 'package:dio/dio.dart';

class WishListRepo {
  final ApisService _apisService;

  WishListRepo(this._apisService);

  Future<void> addToWishList(int productId) async {
    try {
      await _apisService.post("${EndPoints.addToWishList}$productId", {});
    } on DioException catch (e) {
      print(e.error.toString());
      throw ServicesFailure.fromDioError(e);
    }
  }

  Future<void> removeFromWishList(int productId) async {
    try {
      await _apisService.post("${EndPoints.removeFromWishList}$productId", {});
    } on DioException catch (e) {
      print(e.error.toString());
      throw ServicesFailure.fromDioError(e);
    }
  }

 Future<List<int>> getFavoriteProductIds() async {
  try {
    final response = await _apisService.get(EndPoints.getWishList);
    final data = response["data"]["data"] as List;
    return data.map<int>((item) => item["product_id"] as int).toList();
  } on DioException catch (e) {
    print(e.error.toString());
    throw ServicesFailure.fromDioError(e);
  }
}

  Future<Either<Failure, WishlistResponse>> getWishList() async {
    try {
      final response = await _apisService.get(EndPoints.getWishList);
      return Right(WishlistResponse.fromJson(response));
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
