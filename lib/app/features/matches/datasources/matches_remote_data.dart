import 'package:pebol_app/app/features/matches/models/match_response_model.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';

abstract class MatchesRemoteDataSource {
  Future<MatchesResponseModel> getMatches({
    required int championshipId,
  });

  Future<MatchResponseModel> getMatchById(int id);
}
