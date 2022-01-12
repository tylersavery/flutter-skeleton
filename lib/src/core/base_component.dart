import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/config/constants/breakpoints.dart';

abstract class BaseComponent extends ConsumerWidget {
  const BaseComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BreakPoints.useMobileLayout(context)
        ? body(context, ref)
        : desktopBody(context, ref);
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget desktopBody(BuildContext context, WidgetRef ref) {
    // defaults to using standard body if not overridden
    return body(context, ref);
  }
}
