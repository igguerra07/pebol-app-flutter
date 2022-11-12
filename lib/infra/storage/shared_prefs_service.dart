import 'package:shared_preferences/shared_preferences.dart';

import 'package:pebol_app/infra/storage/cache_service.dart';

class SharedPrefsService extends CacheService {
  late final SharedPreferences _sharedPrefs;

  SharedPrefsService({
    required SharedPreferences sharedPrefs,
  }) {
    _sharedPrefs = sharedPrefs;
  }

  @override
  void create({
    required String key,
    required String value,
  }) {
    try {
      _sharedPrefs.setString(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void delete({
    required String key,
  }) {
    try {
      _sharedPrefs.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  String? find({
    required String key,
  }) {
    try {
      final result = _sharedPrefs.getString(key);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
