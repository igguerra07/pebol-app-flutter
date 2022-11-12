class StageModel {
  final int faseId;
  final String nome;
  final String slug;
  final String tipo;
  final String link;

  StageModel({
    required this.faseId,
    required this.nome,
    required this.slug,
    required this.tipo,
    required this.link,
  });

  factory StageModel.fromJson(Map<String, dynamic> json) {
    return StageModel(
      faseId: json['fase_id'],
      nome: json['nome'] ?? "",
      slug: json['slug'] ?? "",
      tipo: json['tipo'] ?? "",
      link: json['_link'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fase_id': faseId,
      'nome': nome,
      'slug': slug,
      'tipo': tipo,
      '_link': link,
    };
  }
}
