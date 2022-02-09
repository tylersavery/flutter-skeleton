import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/generated/l10n.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/audio/components/audio_player.dart';
import 'package:flutter_skeleton/src/feature/audio/components/mini_player.dart';

class DashboardContainer extends BaseComponent {
  const DashboardContainer({Key? key}) : super(key: key);

  static const List<PageRouteInfo> routes = [
    HomeTabRouter(),
    CategoryTabRouter(),
    UsersTabRouter(),
  ];

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              label: S.of(context).homeScreenTitle,
              icon: const Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: S.of(context).categoriesScreenTitle,
              icon: const Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: S.of(context).usersScreenTitle,
              icon: const Icon(Icons.group),
            ),
          ],
        );
      },
      builder: (context, child, animated) => _ContentWrapper(
        child: child,
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: routes,
      appBarBuilder: (_, tabsRouter) {
        return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarColor,
              border: Border(
                bottom: BorderSide(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.2),
                    width: 1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  _DesktopNavigationButton(
                    title: S.of(context).homeScreenTitle,
                    icon: Icons.home,
                    isActive: tabsRouter.activeIndex == 0,
                    onPressed: () {
                      tabsRouter.setActiveIndex(0);
                    },
                  ),
                  _DesktopNavigationButton(
                    title: S.of(context).categoriesScreenTitle,
                    icon: Icons.category,
                    isActive: tabsRouter.activeIndex == 1,
                    onPressed: () {
                      tabsRouter.setActiveIndex(1);
                    },
                  ),
                  _DesktopNavigationButton(
                    title: S.of(context).usersScreenTitle,
                    icon: Icons.group,
                    isActive: tabsRouter.activeIndex == 2,
                    onPressed: () {
                      tabsRouter.setActiveIndex(2);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      builder: (context, child, animated) => _ContentWrapper(
        child: child,
      ),
    );
  }
}

class _ContentWrapper extends BaseComponent {
  final Widget child;
  const _ContentWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: child,
        ),
        const MiniPlayer()
      ],
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: child,
        ),
        const AudioPlayer()
      ],
    );
  }
}

class _DesktopNavigationButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final IconData icon;
  final bool isActive;

  const _DesktopNavigationButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).textTheme.bodyText1!.color!;

    if (!isActive) {
      color = color.withOpacity(0.7);
    }

    return Container(
      color: isActive
          ? Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1)
          : Colors.transparent,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(16.0),
        ),
        icon: Icon(
          icon,
          size: 16,
        ),
        onPressed: onPressed,
        label: Text(title),
      ),
    );
  }
}
