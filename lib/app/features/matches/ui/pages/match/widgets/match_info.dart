import 'package:flutter/material.dart';

class MatchInfo extends StatelessWidget {
  final String round;
  final String stadium;

  const MatchInfo({
    Key? key,
    required this.round,
    required this.stadium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(stadium),
        Text(
          round,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
