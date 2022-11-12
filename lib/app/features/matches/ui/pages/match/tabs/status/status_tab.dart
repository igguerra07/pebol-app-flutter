import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/matches/models/match_status_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/status/status_item.dart';

class StatusTab extends StatelessWidget {
  final MatchStatusModel matchStatus;

  const StatusTab({
    Key? key,
    required this.matchStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeTeam = matchStatus.mandante;
    final awayTeam = matchStatus.visitante;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Column(
        children: [
          StatusItem(
            statusName: "Faltas",
            homeTeamCount: homeTeam.faltas.toDouble(),
            awayTeamCount: awayTeam.faltas.toDouble(),
          ),
          StatusItem(
            statusName: "Escanteios",
            homeTeamCount: homeTeam.escanteios.toDouble(),
            awayTeamCount: awayTeam.escanteios.toDouble(),
          ),
          StatusItem(
            statusName: "Impedimentos",
            homeTeamCount: homeTeam.impedimentos.toDouble(),
            awayTeamCount: awayTeam.impedimentos.toDouble(),
          ),
          StatusItem(
            statusName: "Posse de bola",
            leadingText: "%",
            homeTeamCount: double.parse(
              homeTeam.posseDeBola.replaceAll("%", ""),
            ),
            awayTeamCount: double.parse(
              awayTeam.posseDeBola.replaceAll("%", ""),
            ),
          ),
        ],
      ),
    );
  }
}
