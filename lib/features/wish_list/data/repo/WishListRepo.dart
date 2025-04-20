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
    await _apisService.post("${EndPoints.addToWishList}$productId", {});
  }

  Future<void> removeFromWishList(int productId) async {
    await _apisService
        .post("${EndPoints.removeFromWishList}$productId", {});
  }

  Future<Either<Failure, WishListmodel>> getWishList() async {
    try {
      final response = await _apisService.get(EndPoints.getWishList);
      return Right(WishListmodel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
