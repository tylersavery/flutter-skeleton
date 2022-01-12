import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/core/components/infinite_list.dart';
import 'package:flutter_skeleton/src/feature/category/components/category_card.dart';
import 'package:flutter_skeleton/src/feature/category/models/category.dart';
import 'package:flutter_skeleton/src/feature/category/providers/category_provider.dart';

class CategoryList extends BaseComponent {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _categoryListProvider = ref.watch(categoryListProvider.notifier);

    return InfiniteList<Category>(
      pagingController: _categoryListProvider.pagingController,
      itemBuilder: (context, category, index) => CategoryCard(category),
      emptyText: "No Categories",
      onRefresh: _categoryListProvider.refresh,
    );
  }
}
