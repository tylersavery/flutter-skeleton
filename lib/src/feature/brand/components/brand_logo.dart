import 'package:flutter/material.dart';
import 'package:flutter_skeleton/generated/assets.gen.dart';

class BrandLogo extends StatelessWidget {
  final double maxWidth;
  final double padding;
  final Brightness? forceBrightness;

  const BrandLogo({
    Key? key,
    this.maxWidth = double.infinity,
    this.padding = 8.0,
    this.forceBrightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoAsset = Theme.of(context).brightness == Brightness.light
        ? Assets.images.brandLogoDark
        : Assets.images.brandLogoLight;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Image.asset(logoAsset.path, fit: BoxFit.contain),
      ),
    );
  }
}
