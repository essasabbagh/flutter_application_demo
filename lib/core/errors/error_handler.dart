import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

/* 
  try {
    final params = {
      "apiKey": Constants.key,
      "country": _appPref.getLocal().countryCode,
    };
    final response = await _apiService.get(
      endPoint: "top-headlines",
      params: params,
    );
    // success
    // return either right
    // return data
    final data = BaseResponseDto.fromJson(response.data);
    return Right(data.articles!);
  } catch (error) {
    return Left(ErrorHandler.handle(error).failure);
  }
*/
class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.other.failure;
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      return DataSource.cancel.failure;
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.failure;
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.failure;
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.failure;
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
          error.response?.statusCode ?? 0,
          error.response?.data['message'] ?? '', // ERR_005
        );
      } else {
        return DataSource.other.failure;
      }
    default:
      return DataSource.other.failure;
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  // unprocessableContent,
  other;

  Failure get failure {
    // var context = rootNavigatorKey.currentState!.context;

    return switch (this) {
      DataSource.success => Failure(
          ResponseCode.success,
          'success',
        ),
      DataSource.noContent => Failure(
          ResponseCode.noContent,
          'noContent',
        ),
      DataSource.badRequest => Failure(
          ResponseCode.badRequest,
          'badRequest',
        ),
      DataSource.forbidden => Failure(
          ResponseCode.forbidden,
          'forbidden',
        ),
      DataSource.unauthorised => Failure(
          ResponseCode.unauthorised,
          'unauthorised',
        ),
      DataSource.notFound => Failure(
          ResponseCode.notFound,
          'notFound',
        ),
      // DataSource.unprocessableContent => Failure(
      //     ResponseCode.notFound,
      //     'notFound',
      //   ),
      DataSource.internalServerError => Failure(
          ResponseCode.internalServerError,
          'internalServerError',
        ),
      DataSource.connectTimeout => Failure(
          ResponseCode.connectTimeout,
          'connectTimeout',
        ),
      // Assuming 'cancel' corresponds to 'requestCanceled'
      DataSource.cancel => Failure(
          ResponseCode.cancel,
          'requestCanceled',
        ),
      DataSource.receiveTimeout => Failure(
          ResponseCode.receiveTimeout,
          'receiveTimeout',
        ),
      DataSource.sendTimeout => Failure(
          ResponseCode.sendTimeout,
          'sendTimeout',
        ),
      DataSource.cacheError => Failure(
          ResponseCode.cacheError,
          'cacheError',
        ),
      DataSource.noInternetConnection => Failure(
          ResponseCode.noInternetConnection,
          'noInternetConnection',
        ),
      DataSource.other => Failure(
          ResponseCode.other,
          'error',
        ),
    };
  }
}

class ResponseCode {
  // success with data
  static const int success = HttpStatus.ok;
  // success with no data (no content)
  static const int noContent = HttpStatus.created;
  // API rejected request
  static const int badRequest = HttpStatus.badRequest;
  // user is not authorised
  static const int unauthorised = HttpStatus.unauthorized;
  // API rejected request
  static const int forbidden = HttpStatus.forbidden;
  // not found
  static const int notFound = HttpStatus.notFound;
  // Unprocessable Content
  static const int unprocessableContent = HttpStatus.unprocessableEntity;
  // crash in server side
  static const int internalServerError = HttpStatus.internalServerError;

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int other = -7;
}
