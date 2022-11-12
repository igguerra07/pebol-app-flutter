class MatchesResponseModel {
  final dynamic championship;
  final Map<String, MatchesStageModel> matches;

  MatchesResponseModel({
    required this.matches,
    required this.championship,
  });

  Map<String, dynamic> toJson() {
    final data = matches.map((key, value) => MapEntry(key, value.toJson()));
    return {
      'campeonato': championship,
      'partidas': data,
    };
  }

  factory MatchesResponseModel.fromJson(Map<String, dynamic> map) {
    return MatchesResponseModel(
      championship: map['campeonato'],
      matches: Map<String, dynamic>.from(map['partidas']).map(
        (key, value) => MapEntry(
          key,
          MatchesStageModel.fromJson(value),
        ),
      ),
    );
  }
}

class MatchesStageModel {
  final Map<String, List<MatchModel>> stage;

  MatchesStageModel({
    required this.stage,
  });

  Map<String, dynamic> toJson() {
    final data = stage.map(
      (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
    );
    return Map.from(data);
  }

  factory MatchesStageModel.fromJson(Map<String, dynamic> json) {
    return MatchesStageModel(
      stage: Map<String, List<dynamic>>.from(json).map(
        (key, value) => MapEntry(
          key,
          List.from(value.map((e) => MatchModel.fromJson(e))),
        ),
      ),
    );
  }
}

class MatchModel {
  final int partidaId;
  final String status;
  final String dataRealizacao;
  final String horaRealizacao;
  final TeamModel timeMandante;
  final TeamModel timeVisitante;

  MatchModel({
    required this.status,
    required this.partidaId,
    required this.timeMandante,
    required this.timeVisitante,
    required this.dataRealizacao,
    required this.horaRealizacao,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'partida_id': partidaId,
      'time_mandante': timeMandante,
      'time_visitante': timeVisitante,
      'data_realizacao': dataRealizacao,
      'hora_realizacao': horaRealizacao,
    };
  }

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      status: json['status'] ?? '',
      partidaId: json['partida_id']?.toInt() ?? 0,
      dataRealizacao: json['data_realizacao'] ?? '',
      horaRealizacao: json['hora_realizacao'] ?? '',
      timeMandante: TeamModel.fromJson(json['time_mandante']),
      timeVisitante: TeamModel.fromJson(json['time_visitante']),
    );
  }
}

class TeamModel {
  final int timeId;
  final String sigla;
  final String escudo;
  final String nomePopular;

  TeamModel({
    required this.timeId,
    required this.sigla,
    required this.escudo,
    required this.nomePopular,
  });

  Map<String, dynamic> toJson() {
    return {
      'time_id': timeId,
      'sigla': sigla,
      'escudo': escudo,
      'nome_popular': nomePopular,
    };
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      timeId: json['time_id']?.toInt() ?? 0,
      sigla: json['sigla'] ?? '',
      escudo: json['escudo'] ?? '',
      nomePopular: json['nome_popular'] ?? '',
    );
  }
}
