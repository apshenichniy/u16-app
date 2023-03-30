import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/home/home.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileType = ref
            .watch(authenticationControllerProvider)
            .valueOrNull
            ?.whenOrNull(authenticated: (value) => value) ??
        UserProfileType.junior;

    return AutoTabsRouter(
      routes: profileType.routes,
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: profileType.destinations
                .map(
                  (dest) => NavigationDestination(
                    icon: SvgPicture.asset(dest.iconAsset),
                    selectedIcon: SvgPicture.asset(dest.selectedIconAsset),
                    label: dest.title(context),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
