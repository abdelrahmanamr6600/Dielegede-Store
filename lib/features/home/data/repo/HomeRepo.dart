import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final ApisService _apisService;
  HomeRepo(this._apisService);
  Future<Either<Failure, List<ProductModel>>> fetchProduct(
      {int page = 1 ,
    String query = "",
    int? categoryId,
    int? storeId,
    double? minPrice,
    double? maxPrice,} ) async {
    try {
            final endpoint = query.isNotEmpty ? '/products/search' : '/products';

      final response = await _apisService
          .get(endpoint , query: {'page': page,
          'per_page': 20,
          // 'sort_by': 'created_at',
          // 'order_direction': 'desc',
          // 'status': 'active',
          // 'featured': 'true',
          if (query.isNotEmpty) 'search_query': query,
          if (categoryId != null) 'category_id': categoryId,
          if (storeId != null) 'store_id': storeId,
          if (minPrice != null) 'min_price': minPrice,
          if (maxPrice != null) 'max_price': maxPrice,
          
          
          });
      List<ProductModel> products = (response['data']['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      print('Result: $response');
      print('products: $products');

      // Println('error: ${response.toString()}');

      return Right(products);
    } on DioException catch (e) {
      return Left(ServicesFailure.fromDioError(e));
    }
  }
}
