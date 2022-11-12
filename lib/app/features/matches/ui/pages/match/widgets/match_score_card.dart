import 'package:flutter/material.dart';

import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/widgets/match_info.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/widgets/match_score.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/shield_image.dart';

class MatchScoreCard extends StatelessWidget {
  final String round;
  final String stadium;
  final int awayTeamScore;
  final int homeTeamScore;
  final TeamModel awayTeam;
  final TeamModel homeTeam;

  const MatchScoreCard({
    Key? key,
    required this.round,
    required this.stadium,
    required this.awayTeam,
    required this.homeTeam,
    required this.awayTeamScore,
    required this.homeTeamScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MatchInfo(
              round: round,
              stadium: stadium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShieldImage(
                  url: homeTeam.escudo,
                  size: 64,
                ),
                MatchScore(
                  awayScore: awayTeamScore,
                  homeScore: homeTeamScore,
                ),
                ShieldImage(
                  url: awayTeam.escudo,
                  size: 64,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(homeTeam.nomePopular),
                    const Text(
                      "Casa",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(awayTeam.nomePopular),
                    const Text(
                      "Visitante",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
