import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dio/dio.dart';

class FilterRepo {
  final ApisService _apiService;

  FilterRepo(this._apiService);

  Future<Either<Failure, List<ProductModel>>> getFilteredProducts({
    double? minPrice,
    double? maxPrice,
    List<String>? selectedColors,
    List<String>? selectedSizes,
  }) async {
    try {
      final query = <String, dynamic>{};

      if (minPrice != null) query['min_price'] = minPrice;
      if (maxPrice != null) query['max_price'] = maxPrice;
      if (selectedColors != null) query['colors[]'] = selectedColors;
      if (selectedSizes != null) query['sizes[]'] = selectedSizes;

      final response = await _apiService.get(
        '/products/search',
        query: query,
      );

      final List<ProductModel> products = (response['data']['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();

      return Right(products);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    } catch (e) {
      return Left(ServicesFailure(e.toString()));
    }
  }
}
