class MatchStatusModel {
  final TeamMatchStatus mandante;
  final TeamMatchStatus visitante;

  MatchStatusModel({
    required this.mandante,
    required this.visitante,
  });

  Map<String, dynamic> toJson() {
    return {
      'mandante': mandante.toJson(),
      'visitante': visitante.toJson(),
    };
  }

  factory MatchStatusModel.fromJson(Map<String, dynamic> json) {
    return MatchStatusModel(
      mandante: TeamMatchStatus.fromJson(json['mandante']),
      visitante: TeamMatchStatus.fromJson(json['visitante']),
    );
  }
}

class TeamMatchStatus {
  final int faltas;
  final int escanteios;
  final int impedimentos;
  final String posseDeBola;
  final int chancesDesperdicadas;

  TeamMatchStatus({
    required this.faltas,
    required this.escanteios,
    required this.impedimentos,
    required this.posseDeBola,
    required this.chancesDesperdicadas,
  });

  Map<String, dynamic> toJson() {
    return {
      'faltas': faltas,
      'escanteios': escanteios,
      'impedimentos': impedimentos,
      'posse_de_bola': posseDeBola,
      'chances_desperdicadas': chancesDesperdicadas,
    };
  }

  factory TeamMatchStatus.fromJson(Map<String, dynamic> json) {
    return TeamMatchStatus(
      faltas: json['faltas']?.toInt() ?? 0,
      posseDeBola: json['posse_de_bola'] ?? '0%',
      escanteios: json['escanteios']?.toInt() ?? 0,
      impedimentos: json['impedimentos']?.toInt() ?? 0,
      chancesDesperdicadas: json['chances_desperdicadas']?.toInt() ?? 0,
    );
  }
}
