import 'package:dio/dio.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/network/remote/dio_interseptor.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      MyDioInterceptor(),
    );
  }

  static Future<Response> postData(
      {required Map<String, dynamic> data,
      required String endPoint,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };
    Response response =
        await dio.post(endPoint, data: data, queryParameters: query);
    return response;
  }

  static Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };
    Response response = await dio.get(endPoint, queryParameters: query);
    return response;
  }

  static Future<Response> puttData(
      {required String endPoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String? token}) async {
    dio.options.headers = {
      'Authorization': "Bearer ${token ?? ""}",
      "Accept": "application/json",
      'Content-Type': 'application/json',
    };
    Response response =
        await dio.put(endPoint, data: data, queryParameters: query);
    return response;
  }

  static Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    //token=CashHelper.getString(key: MySharedKeys.token);
    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    Response response = await dio.delete(
      endPoint,
      queryParameters: query,
    );
    return response;
  }

  static Future<Response> PostFormData({
    required String url,
    Map<String, dynamic>? query,
    required FormData data,
    Map<String, dynamic>? header,
    String? token,
  }) async {
    token = CachHelper.getData(key: MySharedKeys.token.toString());

    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      "Accept": "application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.post(url, data: data, queryParameters: query);
  }
}
