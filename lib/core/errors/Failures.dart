import 'package:dio/dio.dart';

abstract class Failure {
  String errorMessage;
  Failure(this.errorMessage);
}

class ServicesFailure extends Failure {
  ServicesFailure(super.errorMessage);

  factory ServicesFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServicesFailure("Connection Time Out With Api Server");
      case DioExceptionType.sendTimeout:
        return ServicesFailure("Send Time Out With Api Server");

      case DioExceptionType.receiveTimeout:
        return ServicesFailure("Receive Time Out With Api Server");

      case DioExceptionType.badCertificate:
        return ServicesFailure("Bad Certificate ");

      case DioExceptionType.badResponse:
        final response = dioError.response;
        final data = response?.data;

        if (response != null && data is Map<String, dynamic>) {
          if (data.containsKey('errors')) {
            final errors = data['errors'] as Map<String, dynamic>;
            final allMessages = errors.entries
                .map((e) => e.value is List
                    ? (e.value as List).join('\n')
                    : e.value.toString())
                .join('\n');
            return ServicesFailure(allMessages);
          }
          return ServicesFailure(data['message'] ?? "Unexpected error");
        }

        return ServicesFailure("There is NO Internet Connection");

      case DioExceptionType.cancel:
        return ServicesFailure("Request To Api Was Canceled");

      case DioExceptionType.connectionError:
        return ServicesFailure("There is NO Internet , connection failed");

      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketExceptions")) {
          return ServicesFailure("There is NO Internet , SocketExceptions ");
        }
        return ServicesFailure("Unexpected Error");
      default:
        return ServicesFailure("ErrorMessage");
    }
  }

  factory ServicesFailure.FromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic>) {
        if (response['message'] == 'login first') {
          return ServicesFailure('login_first');
        }

        if (response.containsKey('errors')) {
          final errors = response['errors'] as Map<String, dynamic>;
          final allMessages = errors.entries
              .map((e) => e.value is List
                  ? (e.value as List).join('\n')
                  : e.value.toString())
              .join('\n');
          return ServicesFailure(allMessages);
        }
        return ServicesFailure(response['message'] ?? 'Something went wrong');
      }
    } else if (statusCode == 404) {
      return ServicesFailure("Server Not Found (404)");
    } else if (statusCode == 405) {
      return ServicesFailure("Method Not Allowed (405)");
    }

    return ServicesFailure("Oops, there was an error. Please try again.");
  }
}
