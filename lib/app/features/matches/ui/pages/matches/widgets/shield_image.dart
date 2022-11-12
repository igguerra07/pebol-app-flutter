import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class ShieldImage extends StatelessWidget {
  final String url;
  final double size;
  final EdgeInsets contentPading;

  const ShieldImage({
    Key? key,
    required this.url,
    this.size = 36,
    this.contentPading = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: size,
      height: size,
      child: ScalableImageWidget.fromSISource(
        cache: ScalableImageCache(size: size.toInt()),
        si: ScalableImageSource.fromSvgHttpUrl(
          Uri.parse(url),
        ),
      ),
    );
  }
}
