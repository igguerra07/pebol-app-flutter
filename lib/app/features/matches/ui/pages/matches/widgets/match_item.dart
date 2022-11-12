import 'package:flutter/material.dart';

import 'package:pebol_app/app/features/matches/models/matches_response_model.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/match_date.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/shield_tile.dart';

class MatchItem extends StatelessWidget {
  final VoidCallback onTap;
  final TeamModel homeTeam;
  final TeamModel awayTeam;
  final String matchHourText;
  final String matchDateText;

  const MatchItem({
    Key? key,
    required this.onTap,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchHourText,
    required this.matchDateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ShieldTile(
                  url: homeTeam.escudo,
                  titleText: homeTeam.nomePopular,
                ),
              ),
              MatchDate(
                hourText: matchHourText,
                dateText: matchDateText,
              ),
              Expanded(
                child: ShieldTile(
                  reversed: true,
                  url: awayTeam.escudo,
                  titleText: awayTeam.nomePopular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
