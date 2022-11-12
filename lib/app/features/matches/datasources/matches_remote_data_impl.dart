import 'package:pebol_app/app/features/matches/datasources/matches_remote_data.dart';
import 'package:pebol_app/app/features/matches/models/match_response_model.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/infra/network/api_client.dart';

class MatchesRemoteDataSourceImpl implements MatchesRemoteDataSource {
  late final ApiClient _apiClient;

  MatchesRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) {
    _apiClient = apiClient;
  }

  @override
  Future<MatchesResponseModel> getMatches({
    required int championshipId,
  }) async {
    final path = "campeonatos/:championship_id:/partidas".replaceAll(
      ":championship_id:",
      "$championshipId",
    );

    try {
      final data = await _apiClient.get(path: path);
      return MatchesResponseModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MatchResponseModel> getMatchById(int id) async {
    final path = "partidas/:id:".replaceAll(":id:", "$id");
    try {
      final data = await _apiClient.get(path: path);
      return MatchResponseModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
