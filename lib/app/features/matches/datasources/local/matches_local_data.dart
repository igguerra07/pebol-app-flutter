import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';

abstract class MatchesLocalDataSource {
  MatchesResponseModel? getMatches();

  void saveMatches(MatchesResponseModel matches);
}
