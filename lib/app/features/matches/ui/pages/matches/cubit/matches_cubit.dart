import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pebol_app/app/features/matches/repositories/matches_repository.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/cubit/matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  late final MatchesRepository _repository;

  MatchesCubit({
    required MatchesRepository repository,
  }) : super(MatchesInitialState()) {
    _repository = repository;
  }

  Future<void> getMatches({
    required int championshipId,
  }) async {
    emit(MatchesLoadingState());

    final eitherMatches = await _repository.getMatches(
      championshipId: championshipId,
    );

    eitherMatches.fold(
      (failure) => emit(MatchesFailureState(message: "Something went wrong...")),
      (data) => emit(MatchesSuccessState(data: data)),
    );
  }
}
