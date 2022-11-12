import 'package:pebol_app/app/features/champs/models/championship_model.dart';
import 'package:pebol_app/app/features/matches/models/line_up_model.dart';
import 'package:pebol_app/app/features/matches/models/match_status_model.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';

class MatchResponseModel {
  final String placar;
  final String status;
  final StadiumModel estadio;
  final String rodada;
  final MatchStatusModel estatisticas;
  final LineUpInfoModel escalacoes;
  final TeamModel timeVisitante;
  final TeamModel timeMandante;
  final String dataRealizacao;
  final String horaRealizacao;
  final int placarMandante;
  final int placarVisitante;
  final ChampionshipModel campeonato;

  MatchResponseModel({
    required this.placar,
    required this.status,
    required this.estadio,
    required this.rodada,
    required this.campeonato,
    required this.escalacoes,
    required this.timeMandante,
    required this.estatisticas,
    required this.timeVisitante,
    required this.dataRealizacao,
    required this.horaRealizacao,
    required this.placarMandante,
    required this.placarVisitante,
  });

  Map<String, dynamic> toJson() {
    return {
      'placar': placar,
      'status': status,
      'estadio': estadio.tojson(),
      'rodada': rodada,
      'estatisticas': estatisticas.toJson(),
      'time_visitante': timeVisitante.toJson(),
      'time_mandante': timeMandante.toJson(),
      'placar_visitante': placarVisitante,
      'placar_mandante': placarMandante,
      'data_realizacao': dataRealizacao,
      'hora_realizacao': horaRealizacao,
      'escalacoes': escalacoes.toJson(),
    };
  }

  factory MatchResponseModel.fromJson(Map<String, dynamic> json) {
    return MatchResponseModel(
      placar: json['placar'] ?? '',
      status: json['status'] ?? '',
      estadio: StadiumModel.fromJson(json['estadio']),
      rodada: json['rodada'] ?? '',
      estatisticas: MatchStatusModel.fromJson(json['estatisticas']),
      escalacoes: LineUpInfoModel.fromJson(json['escalacoes']),
      timeVisitante: TeamModel.fromJson(json['time_visitante']),
      timeMandante: TeamModel.fromJson(json['time_mandante']),
      placarVisitante: json['placar_visitante'] ?? 0,
      placarMandante: json['placar_mandante'] ?? 0,
      dataRealizacao: json['data_realizacao'] ?? '',
      horaRealizacao: json['hora_realizacao'] ?? '',
      campeonato: ChampionshipModel.fromJson(json["campeonato"])
    );
  }
}



class StadiumModel {
  final int estadioId;
  final String nome;

  StadiumModel({
    required this.estadioId,
    required this.nome,
  });

  Map<String, dynamic> tojson() {
    return {
      'estadio_id': estadioId,
      'nome': nome,
    };
  }

  factory StadiumModel.fromJson(Map<String, dynamic> json) {
    return StadiumModel(
      estadioId: json['estadio_id']?.toInt() ?? 0,
      nome: json['nome_popular'] ?? '',
    );
  }
}
