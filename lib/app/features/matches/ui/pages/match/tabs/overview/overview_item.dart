import 'package:flutter/material.dart';

class OverviewItem extends StatelessWidget {
  final String labelText;
  final String valueText;
  final EdgeInsets contentPadding;
  final bool showDivider;

  const OverviewItem({
    Key? key,
    required this.labelText,
    required this.valueText,
    this.showDivider = true,
    this.contentPadding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                valueText,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          if(showDivider) const Divider(),
        ],
      ),
    );
  }
}
