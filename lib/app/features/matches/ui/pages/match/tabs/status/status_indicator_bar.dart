import 'package:flutter/material.dart';

class StatusIndicatorBar extends StatelessWidget {
  final double max;
  final double value;
  final bool reversed;
  final Color color;

  const StatusIndicatorBar({
    Key? key,
    required this.max,
    required this.value,
    required this.color,
    this.reversed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: Colors.transparent,
        trackHeight: 3,
        activeTrackColor: color,
        inactiveTrackColor: color.withOpacity(.4),
        trackShape: const RoundedRectSliderTrackShape(),
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
      ),
      child: IgnorePointer(
        ignoring: true,
        child: Transform.scale(
          scale: reversed ? -1 : 1,
          child: Slider(
            onChanged: (value) {},
            max: max,
            value: value,
          ),
        ),
      ),
    );
  }
}
