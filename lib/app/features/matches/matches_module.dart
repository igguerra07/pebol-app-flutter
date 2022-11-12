import 'package:injectable/injectable.dart';
import 'package:pebol_app/app/di/injector.dart';
import 'package:pebol_app/app/features/matches/datasources/local/matches_local_data.dart';
import 'package:pebol_app/app/features/matches/datasources/local/matches_local_data_impl.dart';
import 'package:pebol_app/app/features/matches/datasources/matches_remote_data.dart';
import 'package:pebol_app/app/features/matches/datasources/matches_remote_data_impl.dart';
import 'package:pebol_app/app/features/matches/repositories/matches_repository.dart';
import 'package:pebol_app/app/features/matches/repositories/matches_repository_impl.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/cubit/match_cubit.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/cubit/matches_cubit.dart';

@module
abstract class MatchesModule {
  @lazySingleton
  MatchesRemoteDataSource get matchesRemote =>
      MatchesRemoteDataSourceImpl(apiClient: getIt());

  @lazySingleton
  MatchesLocalDataSource get matchesLocal =>
      MatchesLocalDataSourceImpl(cacheService: getIt());

  @lazySingleton
  MatchesRepository get matchesRepostiory => MatchesRepositoryImpl(
        remote: getIt(),
        local: getIt(),
      );

  @injectable
  MatchesCubit get matchesCubit => MatchesCubit(repository: getIt());

  @injectable
  MatchCubit get matchCubit => MatchCubit(repository: getIt());
}
