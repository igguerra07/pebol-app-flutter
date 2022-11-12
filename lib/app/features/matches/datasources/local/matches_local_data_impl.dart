import 'dart:convert';

import 'package:pebol_app/app/features/matches/datasources/local/matches_local_data.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/infra/storage/cache_service.dart';

class MatchesLocalDataSourceImpl implements MatchesLocalDataSource {
  late final CacheService _cacheService;

  MatchesLocalDataSourceImpl({
    required CacheService cacheService,
  }) {
    _cacheService = cacheService;
  }

  @override
  MatchesResponseModel? getMatches() {
    final result = _cacheService.find(key: "MATCHES");
    if (result == null) return null;
    final json = jsonDecode(result);
    return MatchesResponseModel.fromJson(json);
  }

  @override
  void saveMatches(MatchesResponseModel matches) {
    final data = jsonEncode(matches.toJson());
    _cacheService.create(key: "MATCHES", value: data);
  }
}
