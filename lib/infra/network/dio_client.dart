import 'package:dio/dio.dart';
import 'package:pebol_app/infra/network/api_client.dart';

class DioClient implements ApiClient {
  late final Dio _dio;

  DioClient({
    required Dio dio,
    required String baseUrl,
  }) {
    _dio = dio;

    dio.options.baseUrl = baseUrl;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'charset': 'utf-8',
      'Authorization': 'Bearer add_your_key'
    };

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  @override
  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
