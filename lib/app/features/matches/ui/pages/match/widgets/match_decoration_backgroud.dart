import 'package:flutter/material.dart';

class MatchDecorationBackground extends StatelessWidget {
  final double heighScale;
  final Radius bottomRadius;

  const MatchDecorationBackground({
    Key? key,
    this.heighScale = .4,
    this.bottomRadius = const Radius.circular(32),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final deviceHeight = deviceSize.height;

    return Container(
      height: deviceHeight * heighScale,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          bottomLeft: bottomRadius,
          bottomRight: bottomRadius,
        ),
      ),
    );
  }
}
