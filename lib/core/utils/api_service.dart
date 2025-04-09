import 'package:dielegende_store/core/utils/end_points.dart';
import 'package:dio/dio.dart';

class ApisService {
  final Dio _dio;

  ApisService(this._dio);

  Future<Map<String, dynamic>> post(String endPoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: DioExceptionType.badResponse,
        error: e.response?.data ?? 'Unknown Error',
      );
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: endPoint),
        type: DioExceptionType.unknown,
        error: e.toString(),
      );
    }
  }
}

