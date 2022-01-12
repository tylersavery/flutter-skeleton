import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_model.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_provider.dart';

class PlaceholderComponent extends BaseComponent {
  final PlaceholderModel item;
  const PlaceholderComponent({Key? key, required this.item}) : super(key: key);

  void _handleTap(BuildContext context, WidgetRef ref) {
    ref.read(placeholderProvider.notifier).remove(item);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        _handleTap(context, ref);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: item.color,
        ),
        child: Center(
          child: Text(item.id.toString()),
        ),
      ),
    );
  }
}
