import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/matches/ui/pages/match/tabs/status/status_indicator_bar.dart';

class StatusItem extends StatelessWidget {
  final String statusName;
  final double homeTeamCount;
  final double awayTeamCount;
  final String leadingText;

  const StatusItem({
    Key? key,
    required this.statusName,
    required this.homeTeamCount,
    required this.awayTeamCount,
    this.leadingText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalValue = awayTeamCount + homeTeamCount;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${homeTeamCount.toInt()}$leadingText",
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                statusName,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "${awayTeamCount.toInt()}$leadingText",
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StatusIndicatorBar(
                    color: Colors.blueAccent,
                    reversed: true,
                    max: totalValue,
                    value: homeTeamCount,
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: StatusIndicatorBar(
                    color: Colors.redAccent,
                    max: totalValue,
                    value: awayTeamCount,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
