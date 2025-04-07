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
        return ServicesFailure.FromBadResponse(
            dioError.response?.statusCode ?? 0, dioError.response?.data ?? "");
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
      if (response != null &&
          response is Map<String, dynamic> &&
          response['message'] == 'login first') {
        return ServicesFailure('login_first');
      }
      return ServicesFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServicesFailure("Server Not Found 404");
    } else if (statusCode == 405) {
      return ServicesFailure("Internal Server Error, Please Try Later");
    } else {
      return ServicesFailure("Oops There Is An Error, Please Try Again");
    }
  }
}
