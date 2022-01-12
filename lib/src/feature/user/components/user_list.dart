import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/core/components/infinite_list.dart';
import 'package:flutter_skeleton/src/feature/user/components/user_card.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';
import 'package:flutter_skeleton/src/feature/user/providers/user_list_provider.dart';

class UserList extends BaseComponent {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _userListProvider = ref.watch(userListProvider.notifier);

    return InfiniteList<User>(
      pagingController: _userListProvider.pagingController,
      itemBuilder: (context, user, index) => UserCard(user),
      emptyText: "No Users",
      onRefresh: _userListProvider.refresh,
    );
  }
}
