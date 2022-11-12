import 'package:equatable/equatable.dart';
import 'package:pebol_app/app/features/matches/models/match_response_model.dart';

abstract class MatchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MatchInitialState extends MatchState {}

class MatchLoadingState extends MatchState {}

class MatchSuccessState extends MatchState {
  final MatchResponseModel data;

  MatchSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class MatchFailureState extends MatchState {
  final String message;

  MatchFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
