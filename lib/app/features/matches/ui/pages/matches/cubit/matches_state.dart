import 'package:equatable/equatable.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';

abstract class MatchesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MatchesInitialState extends MatchesState {}

class MatchesLoadingState extends MatchesState {}

class MatchesSuccessState extends MatchesState {
  final MatchesResponseModel data;

  MatchesSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class MatchesFailureState extends MatchesState {
  final String message;

  MatchesFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
