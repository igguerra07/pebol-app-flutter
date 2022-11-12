class EditionModel {
  final int edicaoId;
  final String nome;
  final String slug;
  final String temporada;
  final String nomePopular;

  EditionModel({
    required this.nome,
    required this.slug,
    required this.edicaoId,
    required this.temporada,
    required this.nomePopular,
  });

  Map<String, dynamic> toJson() {
    return {
      'edicaoId': edicaoId,
      'nome': nome,
      'slug': slug,
      'temporada': temporada,
      'nomePopular': nomePopular,
    };
  }

  factory EditionModel.fromJson(Map<String, dynamic> json) {
    return EditionModel(
      edicaoId: json['edicao_id']?.toInt() ?? 0,
      nome: json['nome'] ?? '',
      slug: json['slug'] ?? '',
      temporada: json['temporada'] ?? '',
      nomePopular: json['nome_popular'] ?? '',
    );
  }
}
