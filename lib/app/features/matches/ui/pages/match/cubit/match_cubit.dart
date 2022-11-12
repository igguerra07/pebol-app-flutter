import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pebol_app/app/features/matches/repositories/matches_repository.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/cubit/match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  late final MatchesRepository _repository;

  MatchCubit({
    required MatchesRepository repository,
  }) : super(MatchInitialState()) {
    _repository = repository;
  }

  Future<void> getMatchById(int id) async {
    emit(MatchLoadingState());
    
    final eitherMatch = await _repository.getMatchById(id);

    eitherMatch.fold(
      (failure) => emit(MatchFailureState(message: "Something went wrong...")),
      (match) => emit(MatchSuccessState(data: match)),
    );
  }
}
