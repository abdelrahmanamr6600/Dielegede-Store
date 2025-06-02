import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/bag/data/model/BagModel.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';
import 'package:dio/dio.dart';

class BagRepo {
  final ApisService apisService;

  BagRepo(this.apisService);

  Future<void> addToBag(
      {required int productId,
      int? quantity,
      Map<String, dynamic>? selectedOptions}) async {
    final body = {
      'product_id': productId,
      'selected_options': selectedOptions ?? {}
    };
    try {
      await apisService.post(EndPoints.bag, body);
    } on DioException catch (e) {
      throw ServicesFailure.fromDioError(e);
    } catch (e) {

      throw ServicesFailure("An error occurred while adding to bag: $e");
    }
  }

  Future<Either<Failure, BagResponse>> getProductsBag() async {
    try {
      final response = await apisService.get(EndPoints.bag);

      final bagResponse = BagResponse.fromJson(response);
      return Right(bagResponse);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(
        ServicesFailure("Unexpected error: $e"),
      );
    }
  }

  Future<Either<Failure, ExpiredBagResponse>> getExpiredProducts() async {
    try {
      final response = await apisService.get(EndPoints.expiredBag);

      final bagResponse = ExpiredBagResponse.fromJson(response);
      return Right(bagResponse);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(
        ServicesFailure("Unexpected error: $e"),
      );
    }
  }

  Future<Either<Failure, Unit>> deleteBagItem(int id) async {
    try {
      await apisService.delete('${EndPoints.bag}/$id');
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(ServicesFailure("Unexpected error: $e"));
    }
  }
}
