import 'package:pebol_app/app/features/champs/models/championship_response_model.dart';
import 'package:pebol_app/infra/network/api_client.dart';

abstract class ChampsRemoteDataSource {
  Future<ChampionshipResponseModel> getChamps();
}

class ChampsRemoteDataSourceImpl implements ChampsRemoteDataSource {
  late final ApiClient _apiClient;

  ChampsRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) {
    _apiClient = apiClient;
  }

  @override
  Future<ChampionshipResponseModel> getChamps() async {
    const path = "campeonatos";
    try {
      final response = await _apiClient.get(path: path);
      final json = response;
      return ChampionshipResponseModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
