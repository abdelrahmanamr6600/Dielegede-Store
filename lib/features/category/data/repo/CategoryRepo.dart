import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/category/data/model/CategoryModel.dart';
import 'package:dielegende_store/features/category/data/model/CategoryProductModel.dart';
import 'package:dielegende_store/features/home/data/model/StoreModel.dart';
import 'package:dio/dio.dart';

class CategoryRepo {
  final ApisService _apisService;

  CategoryRepo(this._apisService);
  Future<Either<Failure, HomeCategoryModel>> fetchCategory() async {
    try {
      final response = await _apisService.get(EndPoints.getCategory);
      final categoryModel = HomeCategoryModel.fromJson(response);

      return Right(categoryModel);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }

  Future<Either<Failure, CategoryProductsResponse>>
      fetchCategoryProducts(int categoryId) async {
    try {
      final response = await _apisService.get('/categories/$categoryId/products');
      final categoryModel = CategoryProductsResponse.fromJson(response);

      return Right(categoryModel);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
