import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String titleText;
  final String labelText;
  final VoidCallback? onTap;
  final EdgeInsets contentPadding;

  const SectionHeader({
    Key? key,
    required this.titleText,
    required this.labelText,
    this.contentPadding = const EdgeInsets.all(16),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleText),
          InkWell(
            onTap: onTap,
            child: Text(
              labelText,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.orangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
