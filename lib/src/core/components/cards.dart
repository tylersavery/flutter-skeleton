import 'package:flutter/material.dart';

class _AppCardHeader extends StatelessWidget {
  final bool dense;
  final String? text;
  final TextAlign alignment;
  final Widget? leading;
  final Widget? trailing;
  const _AppCardHeader({
    Key? key,
    this.text,
    this.alignment = TextAlign.left,
    this.leading,
    this.trailing,
    this.dense = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox();

    return Container(
      color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(dense ? 4.0 : 8.0),
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: leading!,
              ),
            Expanded(
              child: Text(
                text!,
                textAlign: alignment,
                style: TextStyle(
                    fontSize: dense ? 14 : 18.0,
                    fontWeight: dense ? FontWeight.w400 : FontWeight.w600),
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;
  final String? headerText;
  final TextAlign headerAlignment;
  final Widget? headerLeading;
  final Widget? headerTrailing;

  final String? footerText;
  final TextAlign footerAlignment;
  final Widget? footerLeading;
  final Widget? footerTrailing;

  const AppCard({
    Key? key,
    required this.child,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
    this.headerText,
    this.headerAlignment = TextAlign.left,
    this.headerLeading,
    this.headerTrailing,
    this.footerText,
    this.footerAlignment = TextAlign.center,
    this.footerLeading,
    this.footerTrailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AppCardHeader(
            text: headerText,
            alignment: headerAlignment,
            leading: headerLeading,
            trailing: headerTrailing,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: child,
          ),
          _AppCardHeader(
            dense: true,
            text: footerText,
            alignment: footerAlignment,
            leading: footerLeading,
            trailing: footerTrailing,
          ),
        ],
      ),
    );
  }
}
