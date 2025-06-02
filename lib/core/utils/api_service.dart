import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:dio/dio.dart';

class ApisService {
  final Dio _dio;

  ApisService(this._dio);

  Future<dynamic> post(String endPoint, Map<String, dynamic> data) async {
    try {
      final token = await SecureStorageHelper.getToken();
      print("Bearer Token: $token");

      final response = await _dio.post(endPoint,
          data: data,
          options: Options(headers: {  
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }));
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

  Future<dynamic> put(String endPoint, Map<String, dynamic> data) async {
    try {
      final token = await SecureStorageHelper.getToken();
      print("Bearer Token: $token");

      final response = await _dio.put(endPoint,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }));
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

  Future<dynamic> get(String endPoint, {Map<String, dynamic>? query}) async {
    try {
      final token = await SecureStorageHelper.getToken();

      final response = await _dio.get(endPoint,
          queryParameters: query,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }));

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
        requestOptions: RequestOptions(path: endPoint, queryParameters: query),
        type: DioExceptionType.unknown,
        error: e.toString(),
      );
    }
  }

  Future<dynamic> delete(String endPoint) async {
  try {
    final token = await SecureStorageHelper.getToken();
    final response = await _dio.delete(
      endPoint,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      }),
    );
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
