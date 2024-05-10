import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:flutter_application_demo/core/constants/constants.dart';
import 'package:flutter_application_demo/core/constants/nums.dart';
import 'package:flutter_application_demo/core/errors/error_handler.dart';
import 'package:flutter_application_demo/core/errors/failure.dart';

import 'base_response.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/cache_interceptor.dart';

/// Create a singleton class to contain all Dio methods and helper functions
class DioClient {
  DioClient._();

  static final instance = DioClient._();

  static BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    receiveTimeout: timeoutDuration,
    connectTimeout: timeoutDuration,
    sendTimeout: timeoutDuration,
    followRedirects: false,
    responseType: ResponseType.json,
    contentType: Headers.jsonContentType,
    // validateStatus: (status) => status! <= 500,
    headers: {
      'Accept': 'application/json',
      // 'Cache-Control': 'max-age=604800',
    },
  );

  final Dio _dio = Dio()
    ..options = options
    ..interceptors.addAll({
      AuthInterceptor(),
      DioCacheInterceptor(options: cacheOptions),
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: false,
          requestBody: true,
          responseBody: false,
          responseHeader: false,
          request: true,
          error: true,
          compact: true,
          maxWidth: 90,
        )
    });

  CancelToken cancelToken = CancelToken();

  ///Get Method
  Future<BaseResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final data = BaseResponse.fromJson(response.data);

      if (!data.success) throw Failure(data.status, data.message);

      return data;
    } catch (err) {
      throw ErrorHandler.handle(err).failure;
    }
  }

  ///Post Method
  Future<Response> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
      // if (response.statusCode == 200 || response.statusCode == 201) {
      // }
      // throw "something went wrong";
    } catch (err) {
      // rethrow;
      throw ErrorHandler.handle(err).failure;
    }
  }

  ///Put Method
  Future<Response> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;

      // if (response.statusCode == 200) return response.data;

      // throw "something went wrong";
    } catch (err) {
      // rethrow;
      throw ErrorHandler.handle(err).failure;
    }
  }

  ///Delete Method
  Future<Response> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;

      // if (response.statusCode == 204) return response;
      // throw 'something went wrong';
    } catch (err) {
      // rethrow;
      throw ErrorHandler.handle(err).failure;
    }
  }
}
