import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/core/dialogs/dialogs.dart';
import 'package:flutter_skeleton/src/feature/category/models/category.dart';

class CategoryCard extends BaseComponent {
  final Category category;
  const CategoryCard(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          InfoDialog.show(
            title: category.name,
            content: Text(category.slug),
            closeText: "Okay",
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(category.name),
        ),
      ),
    );
  }
}
