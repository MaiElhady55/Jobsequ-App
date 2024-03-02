import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MyDioInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('ERROR ${err.message}');
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('REQ URI ${options.uri}');
    }
    if (kDebugMode) {
      print('REQ DATA ${options.data}');
    }
    if (kDebugMode) {
      print('Headers ${options.headers}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(' STATUSCODE ${response.statusCode}');
    }
    if (kDebugMode) {
      print('RESP ${response.data}');
    }
    if (kDebugMode) {
      print(response.statusMessage);
    }
    handler.next(response);
  }
}