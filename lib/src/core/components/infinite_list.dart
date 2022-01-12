import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/components/empty_placeholder.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteList<T> extends StatelessWidget {
  final PagingController<int, T> pagingController;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Function onRefresh;
  final String emptyText;

  const InfiniteList({
    Key? key,
    required this.pagingController,
    required this.itemBuilder,
    required this.emptyText,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => onRefresh()),
      child: PagedListView<int, T>(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          noItemsFoundIndicatorBuilder: (_) =>
              EmptyPlaceholder(title: emptyText),
        ),
      ),
    );
  }
}
