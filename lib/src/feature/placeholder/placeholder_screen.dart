import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_list.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_provider.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

class PlaceholderScreen extends BaseScreen {
  const PlaceholderScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 8.0,
          horizontalPadding: 8.0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Placeholders"),
    );
  }

  @override
  FloatingActionButton? floatingActionButton(
    BuildContext context,
    WidgetRef ref,
  ) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: ref.read(placeholderProvider.notifier).addItem,
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const PlaceholderList();
  }
}
