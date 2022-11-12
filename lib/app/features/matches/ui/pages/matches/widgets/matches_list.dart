import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/match_item.dart';

typedef FutureVoidCallback = Future Function();

class MatchesList extends StatelessWidget {
  final List<MatchModel> matches;
  final Function(MatchModel) onTap;
  final FutureVoidCallback onRefresh;

  const MatchesList({
    Key? key,
    required this.onTap,
    required this.matches,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: matches.length,
        itemBuilder: (_, index) {
          final match = matches[index];
          final homeTeam = match.timeMandante;
          final awayTeam = match.timeVisitante;
          return MatchItem(
            onTap: () => onTap(match),
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            matchHourText: match.horaRealizacao,
            matchDateText: match.dataRealizacao,
          );
        },
      ),
    );
  }
}
