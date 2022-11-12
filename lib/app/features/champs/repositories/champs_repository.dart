import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/champs/datasources/champs_remote_data.dart';
import 'package:pebol_app/app/features/champs/models/championship_response_model.dart';

abstract class ChampsRepository {
  Future<Either<bool, ChampionshipResponseModel>> getChamps();
}

class ChampsRepositoryImpl implements ChampsRepository {
  late final ChampsRemoteDataSource _remote;

  ChampsRepositoryImpl({
    required ChampsRemoteDataSource remote,
  }) {
    _remote = remote;
  }

  @override
  Future<Either<bool, ChampionshipResponseModel>> getChamps() async {
    try {
      final data = await _remote.getChamps();
      return right(data);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return left(false);
    }
  }
}
