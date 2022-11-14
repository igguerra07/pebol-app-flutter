import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/matches/models/match_response_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/overview/overview_item.dart';

class OverviewTab extends StatelessWidget {
  final MatchResponseModel match;

  const OverviewTab({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       padding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 8,
    ),
      child: Column(
        children: [
           OverviewItem(
            labelText: "Campeonato",
            valueText:  match.campeonato.nomePopular,
          ),
           OverviewItem(
            labelText: "Rodada",
            valueText: match.rodada,
          ),
           OverviewItem(
            labelText: "Status",
            valueText: match.status,
          ),
           OverviewItem(
            labelText: "Placar",
            valueText: match.placar,
          ),
           OverviewItem(
            labelText: "Estádio",
            valueText: match.estadio.nome,
          ),
           OverviewItem(
            labelText: "Data",
            valueText: match.dataRealizacao,
          ),
           OverviewItem(
            labelText: "Hora",
            valueText: match.horaRealizacao,
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
