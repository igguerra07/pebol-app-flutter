abstract class ApiClient {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic> queryParams,
  });
}
