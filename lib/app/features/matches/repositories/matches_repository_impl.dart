import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pebol_app/app/features/matches/datasources/local/matches_local_data.dart';
import 'package:pebol_app/app/features/matches/datasources/matches_remote_data.dart';
import 'package:pebol_app/app/features/matches/models/match_response_model.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/app/features/matches/repositories/matches_repository.dart';

class MatchesRepositoryImpl implements MatchesRepository {
  late final MatchesLocalDataSource _local;
  late final MatchesRemoteDataSource _remote;

  MatchesRepositoryImpl({
    required MatchesLocalDataSource local,
    required MatchesRemoteDataSource remote,
  }) {
    _local = local;
    _remote = remote;
  }

  @override
  Future<Either<bool, MatchesResponseModel>> getMatches({
    required int championshipId,
  }) async {
    try {
      final cache = _local.getMatches();
      if (cache != null) return right(cache);
      final data = await _remote.getMatches(championshipId: championshipId);
      _local.saveMatches(data);
      return right(data);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return left(false);
    }
  }

  @override
  Future<Either<bool, MatchResponseModel>> getMatchById(int id) async {
    try {
      final data = await _remote.getMatchById(id);
      return right(data);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return left(false);
    }
  }
}
