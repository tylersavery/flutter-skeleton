import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/core/components/badges.dart';
import 'package:flutter_skeleton/src/core/components/buttons.dart';
import 'package:flutter_skeleton/src/core/components/cards.dart';
import 'package:flutter_skeleton/src/feature/theme/app_theme.dart';

class StyleguideScreen extends BaseScreen {
  const StyleguideScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Style Guide"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _textTheme = Theme.of(context).textTheme;
    final _colorScheme = Theme.of(context).colorScheme;

    final List<IconData> _icons = [
      Icons.favorite,
      Icons.favorite_outline,
      Icons.bookmark,
      Icons.bookmark_outline,
      Icons.delete,
      Icons.play_arrow_rounded,
      Icons.pause_rounded,
      Icons.shuffle_rounded,
      Icons.shuffle_on_rounded,
      Icons.repeat_rounded,
      Icons.repeat_one_rounded,
      Icons.repeat_on_rounded,
      Icons.playlist_play_rounded,
      Icons.playlist_add,
      Icons.skip_previous_rounded,
      Icons.skip_next_rounded,
      Icons.volume_mute,
      Icons.more_horiz,
      Icons.more_vert,
      Icons.chevron_left,
      Icons.chevron_right,
      Icons.keyboard_arrow_down_rounded,
      Icons.keyboard_arrow_up_rounded,
      Icons.close,
      Icons.email,
      Icons.phone,
      Icons.place,
      Icons.check,
      Icons.warning,
      Icons.error,
      Icons.notification_important,
      Icons.add,
      Icons.waves,
      Icons.sort,
      Icons.filter_list,
      Icons.person,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _Heading("Headings"),
          Text("Heading 1", style: _textTheme.headline1),
          Text("Heading 2", style: _textTheme.headline2),
          Text("Heading 3", style: _textTheme.headline3),
          Text("Heading 4", style: _textTheme.headline4),
          Text("Heading 5", style: _textTheme.headline5),
          Text("Heading 6", style: _textTheme.headline6),
          Text("Subtitle 1", style: _textTheme.subtitle1),
          Text("Subtitle 2", style: _textTheme.subtitle2),
          const _Heading("Buttons"),
          Wrap(
            children: [
              AppButton(
                label: "Elevated Primary",
                onPressed: () {},
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Outlined Primary",
                onPressed: () {},
                type: AppButtonType.Outlined,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Text Primary",
                onPressed: () {},
                type: AppButtonType.Text,
              ),
            ],
          ),
          const _Spacer(),
          Wrap(
            children: [
              AppButton(
                label: "Elevated Secondary",
                onPressed: () {},
                variant: AppColorVariant.Secondary,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Outlined Secondary",
                onPressed: () {},
                type: AppButtonType.Outlined,
                variant: AppColorVariant.Secondary,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Text Secondary",
                onPressed: () {},
                type: AppButtonType.Text,
                variant: AppColorVariant.Secondary,
              ),
            ],
          ),
          const _Spacer(),
          Wrap(
            children: [
              AppButton(
                label: "Elevated Danger",
                onPressed: () {},
                variant: AppColorVariant.Danger,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Outlined Danger",
                onPressed: () {},
                type: AppButtonType.Outlined,
                variant: AppColorVariant.Danger,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Text Danger",
                onPressed: () {},
                type: AppButtonType.Text,
                variant: AppColorVariant.Danger,
              ),
            ],
          ),
          const _Spacer(),
          Wrap(
            children: [
              AppButton(
                label: "Icon",
                onPressed: () {},
                icon: Icons.favorite,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Processing",
                onPressed: () {},
                processing: true,
                variant: AppColorVariant.Secondary,
                type: AppButtonType.Outlined,
              ),
              const _Spacer(horizontal: true),
              const AppButton(
                label: "Disabled",
              ),
            ],
          ),
          const _Heading("Text"),
          Text(
            "Body Text 1: Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat.",
            style: _textTheme.bodyText1,
          ),
          const _Spacer(),
          Text(
            "Body Text 2: Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat.",
            style: _textTheme.bodyText2,
          ),
          const _Spacer(),
          Text(
            "Caption: Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat.",
            style: _textTheme.caption,
          ),
          const _Heading("List Tiles"),
          ListTile(
            title: const Text("List Tile"),
            subtitle: const Text("Default list tile..."),
            leading: const Icon(Icons.inbox),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            dense: true,
            title: const Text("Dense List Tile"),
            subtitle: const Text("Dense list tile..."),
            leading: const Icon(Icons.inbox),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const _Heading("Cards"),
          Wrap(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: const AppCard(
                  child: Text(
                    "Simple Card",
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: const AppCard(
                  headerText: "Header here",
                  child: Text(
                    "Card with header",
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: const AppCard(
                  headerText: "Header here",
                  footerText: "Footer here",
                  headerTrailing: AppBadge(label: "Badge"),
                  child: Text(
                    "Card with header and footer",
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: AppCard(
                  headerText: "A Lovely Card",
                  headerLeading: const Icon(Icons.verified),
                  headerTrailing: IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(
                      Icons.more_horiz,
                    ),
                    onPressed: () {},
                  ),
                  child: const Text(
                    "This is a card",
                  ),
                  footerText: "The is the footer",
                ),
              ),
            ],
          ),
          const _Heading("Icons"),
          Wrap(children: _icons.map((icon) => _Icon(icon)).toList())
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String label;
  const _Heading(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class _Spacer extends StatelessWidget {
  final double size;
  final bool horizontal;
  const _Spacer({Key? key, this.size = 12.0, this.horizontal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return horizontal ? SizedBox(width: size) : SizedBox(height: size);
  }
}

class _Icon extends StatelessWidget {
  final IconData icon;
  const _Icon(
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(icon),
    );
  }
}
