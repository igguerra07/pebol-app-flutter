import 'package:flutter/material.dart';
import 'package:pebol_app/app/features/matches/ui/pages/matches/widgets/shield_image.dart';

class ShieldTile extends StatelessWidget {
  final String url;
  final bool reversed;
  final String titleText;
  final EdgeInsets contentPading;

  const ShieldTile({
    Key? key,
    required this.url,
    required this.titleText,
    this.reversed = false,
    this.contentPading = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final mainAxisAlignment =
        reversed ? MainAxisAlignment.start : MainAxisAlignment.end;

    List<Widget> children = [
      Text(titleText, style: const TextStyle(fontSize: 10)),
      ShieldImage(url: url),
    ];

    if (reversed) children = children.reversed.toList();

    return Container(
      padding: contentPading,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
