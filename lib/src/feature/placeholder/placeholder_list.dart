import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_component.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_provider.dart';

class PlaceholderList extends BaseComponent {
  const PlaceholderList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(children: _content(context, ref));
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Row(children: _content(context, ref));
  }

  List<Widget> _content(BuildContext context, WidgetRef ref) {
    return ref
        .watch(placeholderProvider)
        .map(
          (item) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: PlaceholderComponent(
              item: item,
            ),
          ),
        )
        .toList();
  }
}
