import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/config/constants/breakpoints.dart';
import 'package:flutter_skeleton/src/core/drawers/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseScreen extends ConsumerWidget {
  const BaseScreen({
    Key? key,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
    this.includeMainDrawer = false,
  }) : super(key: key);

  final double verticalPadding;
  final double horizontalPadding;
  final bool includeMainDrawer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(context, ref),
      drawer: includeMainDrawer ? const MainDrawer() : null,
      floatingActionButton: floatingActionButton(context, ref),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: BreakPoints.useMobileLayout(context)
            ? body(context, ref)
            : desktopBody(context, ref),
      ),
    );
  }

  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return null;
  }

  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    return null;
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget desktopBody(BuildContext context, WidgetRef ref) {
    // defaults to using standard body if not overridden
    return body(context, ref);
  }
}
