class RoundModel {
  final String? nome;
  final String? slug;
  final int? rodada;
  final String? status;
  //RoundModel? proximaRodada;
  //Null? rodadaAnterior;
  final String? sLink;
  RoundModel({
    this.nome,
    this.slug,
    this.rodada,
    this.status,
    this.sLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'slug': slug,
      'rodada': rodada,
      'status': status,
      'sLink': sLink,
    };
  }

  factory RoundModel.fromJson(Map<String, dynamic> json) {
    return RoundModel(
      nome: json['nome'] ?? "",
      slug: json['slug'] ?? "",
      rodada: json['rodada']?.toInt(),
      status: json['status'] ?? "",
      sLink: json['sLink'] ?? "",
    );
  }
}
