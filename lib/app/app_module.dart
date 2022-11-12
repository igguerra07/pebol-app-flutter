import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/infra/network/api_client.dart';
import 'package:pebol_app/infra/network/dio_client.dart';
import 'package:pebol_app/infra/storage/cache_service.dart';
import 'package:pebol_app/infra/storage/shared_prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://api.api-futebol.com.br/v1/";

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  @lazySingleton
  CacheService get cacheService => SharedPrefsService(sharedPrefs: getIt());

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get apiClient => DioClient(dio: dio, baseUrl: baseUrl);
}
