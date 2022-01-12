import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';
import 'package:flutter_skeleton/src/feature/user/services/user_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserListProvider extends StateNotifier<List<User>> {
  final PagingController<int, User> pagingController =
      PagingController(firstPageKey: 1);

  UserListProvider([List<User> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await UserService().list(page: page);

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

final userListProvider = StateNotifierProvider<UserListProvider, List<User>>(
  (ref) => UserListProvider(),
);
