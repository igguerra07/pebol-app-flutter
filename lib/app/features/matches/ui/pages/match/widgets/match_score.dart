import 'package:flutter/material.dart';

class MatchScore extends StatelessWidget {
  final int homeScore;
  final int awayScore;

  const MatchScore({
    Key? key,
    required this.homeScore,
    required this.awayScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$homeScore",
          style: const TextStyle(fontSize: 32),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            ":",
            style: TextStyle(fontSize: 32),
          ),
        ),
        Text(
          "$awayScore",
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
