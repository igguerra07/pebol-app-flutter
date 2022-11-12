import 'package:pebol_app/app/features/champs/models/edition_model.dart';
import 'package:pebol_app/app/features/champs/models/round_model.dart';
import 'package:pebol_app/app/features/champs/models/stage_model.dart';

class ChampionshipModel {
  final int campeonatoId;
  final String nome;
  final String slug;
  final String nomePopular;
  final EditionModel? edicaoAtual;
  final StageModel? faseAtual;
  final RoundModel? rodadaAtual;
  final String status;
  final String tipo;
  final String logo;
  final String sLink;

  ChampionshipModel({
    required this.campeonatoId,
    required this.nome,
    required this.slug,
    required this.nomePopular,
    required this.edicaoAtual,
    required this.faseAtual,
    required this.rodadaAtual,
    required this.status,
    required this.tipo,
    required this.logo,
    required this.sLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'campeonatoId': campeonatoId,
      'nome': nome,
      'slug': slug,
      'nomePopular': nomePopular,
      'edicaoAtual': edicaoAtual?.toJson(),
      'faseAtual': faseAtual?.toJson(),
      'rodadaAtual': rodadaAtual?.toJson(),
      'status': status,
      'tipo': tipo,
      'logo': logo,
      'sLink': sLink,
    };
  }

  factory ChampionshipModel.fromJson(Map<String, dynamic> json) {
    return ChampionshipModel(
      campeonatoId: json['campeonato_id']?.toInt() ?? 0,
      nome: json['nome'] ?? '',
      slug: json['slug'] ?? '',
      nomePopular: json['nome_popular'] ?? '',
      edicaoAtual: json['edicao_atual'] != null
          ? EditionModel.fromJson(json['edicao_atual'])
          : null,
      faseAtual: json['fase_atual'] != null
          ? StageModel.fromJson(json['fase_atual'])
          : null,
      rodadaAtual: json['rodada_atual'] != null
          ? RoundModel.fromJson(json['rodada_atual'])
          : null,
      status: json['status'] ?? '',
      tipo: json['tipo'] ?? '',
      logo: json['logo'] ?? '',
      sLink: json['sLink'] ?? '',
    );
  }
}
