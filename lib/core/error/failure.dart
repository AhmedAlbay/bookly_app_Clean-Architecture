import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServices');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServices');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServices');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request To ApiServer is Canceled');
      case DioExceptionType.connectionError:
        if (e.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Please try again');
        }
      default:
        return ServerFailure('Opps There was an Error, please Try Again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your requset not Found,Please Try Later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error,Please Try Later!');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('Opps There was an Error, please Try Again');
    }
  }
}
