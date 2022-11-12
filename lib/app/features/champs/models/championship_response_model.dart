import 'package:pebol_app/app/features/champs/models/championship_model.dart';

class ChampionshipResponseModel {
  final List<ChampionshipModel> results;

  ChampionshipResponseModel({
    required this.results,
  });

  Map<String, dynamic> toJson() {
    return {
      'championships': results.map((x) => x.toJson()).toList(),
    };
  }

  factory ChampionshipResponseModel.fromJson(dynamic json) {
    return ChampionshipResponseModel(
      results: List.from(
        json?.map(
          (x) => ChampionshipModel.fromJson(x),
        ),
      ),
    );
  }
}
