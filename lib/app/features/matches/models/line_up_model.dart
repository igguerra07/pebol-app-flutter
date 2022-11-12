class LineUpInfoModel {
  final TeamLineUpModel mandante;
  final TeamLineUpModel visitante;

  LineUpInfoModel({
    required this.mandante,
    required this.visitante,
  });

  Map<String, dynamic> toJson() {
    return {
      'mandante': mandante.toJson(),
      'visitante': visitante.toJson(),
    };
  }

  factory LineUpInfoModel.fromJson(Map<String, dynamic> json) {
    return LineUpInfoModel(
      mandante: TeamLineUpModel.fromJson(json['mandante']),
      visitante: TeamLineUpModel.fromJson(json['visitante']),
    );
  }
}

class TeamLineUpModel {
  final CouchModel tecnico;
  final String esquemaTatico;
  final List<PlayerDataModel> titulares;

  TeamLineUpModel({
    required this.tecnico,
    required this.esquemaTatico,
    required this.titulares,
  });

  Map<String, dynamic> toJson() {
    return {
      'tecnico': tecnico.toJson(),
      'esquemaTatico': esquemaTatico,
      'titulares': titulares.map((x) => x.toJson()).toList(),
    };
  }

  factory TeamLineUpModel.fromJson(Map<String, dynamic> json) {
    return TeamLineUpModel(
      tecnico: CouchModel.fromJson(json['tecnico']),
      esquemaTatico: json['esquema_tatico'] ?? '',
      titulares: List<PlayerDataModel>.from(
        json['titulares']?.map(
          (x) => PlayerDataModel.fromJson(x),
        ),
      ),
    );
  }
}

class CouchModel {
  final int tecnicoId;
  final String nomePopular;

  CouchModel({
    required this.tecnicoId,
    required this.nomePopular,
  });

  Map<String, dynamic> toJson() {
    return {
      'tecnico_id': tecnicoId,
      'nome_popular': nomePopular,
    };
  }

  factory CouchModel.fromJson(Map<String, dynamic> json) {
    return CouchModel(
      tecnicoId: json['tecnico_id'] ?? '',
      nomePopular: json['nome_popular'] ?? '',
    );
  }
}

class PlayerDataModel {
  final PlayerModel atleta;
  final String camisa;
  final List<PositionModel> posicao;

  PlayerDataModel({
    required this.atleta,
    required this.camisa,
    required this.posicao,
  });

  Map<String, dynamic> toJson() {
    return {
      'camisa': camisa,
      'atleta': atleta.toJson(),
      'posicao': posicao.map((e) => e.toJson()).toList(),
    };
  }

  factory PlayerDataModel.fromJson(Map<String, dynamic> json) {
    return PlayerDataModel(
      camisa: json['camisa'] ?? '',
      atleta: PlayerModel.fromJson(json['atleta']),
      posicao: (json['posicao'].runtimeType == List)
          ? List<PositionModel>.from(
              json['posicao']?.map((x) => PositionModel.fromJson(x)),
            )
          : [PositionModel.fromJson(json['posicao'])],
    );
  }
}

class PlayerModel {
  final int atletaId;
  final String nomePopular;

  PlayerModel({
    required this.atletaId,
    required this.nomePopular,
  });

  Map<String, dynamic> toJson() {
    return {
      'atleta_id': atletaId,
      'nome_popular': nomePopular,
    };
  }

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      atletaId: json['atleta_id'] ?? '',
      nomePopular: json['nome_popular'] ?? '',
    );
  }
}

class PositionModel {
  final String sigla;
  final String nome;

  PositionModel({
    required this.sigla,
    required this.nome,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'singla': sigla,
    };
  }

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      nome: json['nome'] ?? '',
      sigla: json['sigla'] ?? '',
    );
  }
}
