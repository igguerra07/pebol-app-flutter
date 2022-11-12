import 'package:flutter/material.dart';

import 'package:pebol_app/app/features/matches/models/line_up_model.dart';

class LineUpTab extends StatefulWidget {
  final TeamLineUpModel awayTeamLineUp;
  final TeamLineUpModel homeTeamLineUp;

  const LineUpTab({
    Key? key,
    required this.awayTeamLineUp,
    required this.homeTeamLineUp,
  }) : super(key: key);

  @override
  State<LineUpTab> createState() => _LineUpTabState();
}

class _LineUpTabState extends State<LineUpTab> {
  @override
  Widget build(BuildContext context) {
    final lineUp = widget.awayTeamLineUp.titulares;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: lineUp.length,
        itemBuilder: (_, index) {
          final player = lineUp[index];
          final position =
              player.posicao.isNotEmpty ? player.posicao.single.sigla : "SEM";
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(player.camisa),
              Text(player.atleta.nomePopular),
              Text(position),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}
