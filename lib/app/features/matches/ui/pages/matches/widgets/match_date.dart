import 'package:flutter/material.dart';

class MatchDate extends StatelessWidget {
  final String dateText;
  final String hourText;
  final EdgeInsets contentPadding;

  const MatchDate(
      {Key? key,
      required this.dateText,
      required this.hourText,
      this.contentPadding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      child: Column(
        children: [
          Text(hourText),
          Text(
            dateText.replaceAll("/2022", ""),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
