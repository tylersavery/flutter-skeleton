import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

class AppBadge extends StatelessWidget {
  final AppColorVariant variant;
  final String label;

  const AppBadge({
    Key? key,
    required this.label,
    this.variant = AppColorVariant.Primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.appVariantToColor(context, variant),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
