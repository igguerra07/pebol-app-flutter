import 'package:flutter/material.dart';

import 'package:pebol_app/app/features/matches/models/line_up_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/line_up/line_up_item.dart';

class LineUpList extends StatelessWidget {
  final List<PlayerDataModel> lineUp;

  const LineUpList({
    Key? key,
    required this.lineUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: lineUp.length,
        itemBuilder: (_, index) {
          final player = lineUp[index];
          return LineUpItem(player: player);
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}
