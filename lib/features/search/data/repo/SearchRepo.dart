import 'package:dartz/dartz.dart';
import 'package:dielegende_store/core/utils/api_service.dart';
import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/search/data/model/SearchModel.dart';

class SearchProductRepo {
  final ApisService apiService;

  SearchProductRepo(this.apiService);

  Future<Either<String, List<ProductModel>>> searchProducts(
      String query) async {
    try {
      final response =
          await apiService.get(EndPoints.advancedProductSearch, query: {
        'search_query': query,
      });
      print(response); // اطبع الرد هنا

      final searchResponse = SearchProductsResponse.fromJson(response);
      return Right(searchResponse.data.products);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
