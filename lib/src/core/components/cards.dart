import 'package:flutter/material.dart';

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

  final String? heroImage;
  final String? heroTitle;
  final String? heroSubtitle;
  final Function()? onHeroPressed;

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
    this.heroImage,
    this.heroTitle,
    this.heroSubtitle,
    this.onHeroPressed,
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
          if (heroImage != null)
            IgnorePointer(
              ignoring: onHeroPressed == null,
              child: InkWell(
                onTap: onHeroPressed,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context)
                            .textTheme
                            .headline6!
                            .color!
                            .withOpacity(0.1),
                      ),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          heroImage!,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                        ),
                        if (heroTitle != null) Container(color: Colors.black54),
                        if (heroTitle != null)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                heroTitle!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                              if (heroSubtitle != null)
                                Text(
                                  heroSubtitle!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(color: Colors.white),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
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
                text ?? "",
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
