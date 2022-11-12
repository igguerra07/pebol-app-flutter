import 'package:flutter/material.dart';

import 'package:pebol_app/app/features/matches/models/line_up_model.dart';

class LineUpItem extends StatelessWidget {
  final PlayerDataModel player;

  const LineUpItem({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
