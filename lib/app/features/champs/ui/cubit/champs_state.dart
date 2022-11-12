import 'package:equatable/equatable.dart';
import 'package:pebol_app/app/features/champs/models/championship_response_model.dart';

abstract class ChampsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChampsInitialState extends ChampsState {}

class ChampsLoadingState extends ChampsState {}

class ChampsSuccessState extends ChampsState {
  final ChampionshipResponseModel data;

  ChampsSuccessState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class ChampsFailureState extends ChampsState {
  final String message;

  ChampsFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
