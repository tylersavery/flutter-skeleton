import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/feature/category/models/category.dart';
import 'package:flutter_skeleton/src/feature/category/services/category_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoryListProvider extends StateNotifier<List<Category>> {
  final PagingController<int, Category> pagingController =
      PagingController(firstPageKey: 1);

  CategoryListProvider([List<Category> initialItems = const []])
      : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await CategoryService().list(page: page);

      if (data.page >= data.num_pages) {
        pagingController.appendLastPage(data.results);
      } else {
        pagingController.appendPage(data.results, data.page + 1);
      }

      state = [...state, ...data.results];
    } catch (error) {
      pagingController.error = error;
    }
  }

  void refresh() {
    state = [];
    pagingController.refresh();
  }
}

final categoryListProvider =
    StateNotifierProvider<CategoryListProvider, List<Category>>(
  (ref) => CategoryListProvider(),
);
