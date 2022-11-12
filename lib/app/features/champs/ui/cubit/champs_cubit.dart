import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pebol_app/app/features/champs/repositories/champs_repository.dart';
import 'package:pebol_app/app/features/champs/ui/cubit/champs_state.dart';

class ChampsCubit extends Cubit<ChampsState> {
  late final ChampsRepository _repository;

  ChampsCubit({
    required ChampsRepository repository,
  }) : super(ChampsInitialState()) {
    _repository = repository;
  }

  Future<void> getChamps() async {
    emit(ChampsLoadingState());
    final eitherChamps = await _repository.getChamps();
    eitherChamps.fold(
      (failure) => emit(ChampsFailureState(message: "Something went wrong...")),
      (data) => emit(ChampsSuccessState(data: data)),
    );
  }
}
