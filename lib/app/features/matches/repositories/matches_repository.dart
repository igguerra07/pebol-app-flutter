import 'package:dartz/dartz.dart';
import 'package:pebol_app/app/features/matches/models/match_response_model.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';

abstract class MatchesRepository {
  Future<Either<bool, MatchesResponseModel>> getMatches({
    required int championshipId,
  });

  Future<Either<bool, MatchResponseModel>> getMatchById(int id);
}
