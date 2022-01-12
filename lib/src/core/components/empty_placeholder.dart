import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';

class EmptyPlaceholder extends BaseComponent {
  final String title;
  final Widget? trailing;
  final Widget? leading;
  final IconData? icon;

  const EmptyPlaceholder({
    Key? key,
    required this.title,
    this.trailing,
    this.leading,
    this.icon,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (leading != null) leading!,
          const SizedBox(
            height: 32,
          ),
          Icon(
            icon ?? Icons.new_releases,
            size: 46,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}
