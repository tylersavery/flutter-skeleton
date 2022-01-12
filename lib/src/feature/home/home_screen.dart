import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/generated/l10n.dart';
import 'package:flutter_skeleton/src/feature/auth/components/auth_button.dart';
import 'package:flutter_skeleton/src/feature/home/home_provider.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_list.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key})
      : super(
          key: key,
          includeMainDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(S.of(context).homeScreenTitle),
      actions: const [AuthButton()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const PlaceholderList(),
        const SizedBox(
          height: 32,
        ),
        OutlinedButton(
          onPressed: ref.read(homeScreenProvider).handleEdit,
          child: Text(S.of(context).edit),
        )
      ],
    );
  }
}
