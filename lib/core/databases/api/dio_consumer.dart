import 'package:dio/dio.dart';

import '../../errors/expentions.dart';
import 'api_consumer.dart';
import 'end_points.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baserUrl;
  }

  @override
  Future post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false,
      }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data; // ✅ Return the parsed response body
    } on DioException catch (e) {
      handleDioException(e);
      rethrow; // Optionally rethrow if you want to handle this at a higher level
    }
  }


//!GET
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!DELETE
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

//!PATCH
  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
