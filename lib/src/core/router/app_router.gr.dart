// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    RatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RatingPage(),
      );
    },
    ChooseProfileTypeRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseProfileTypeRouteArgs>(
          orElse: () => const ChooseProfileTypeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseProfileTypePage(
          dateOfBirth: args.dateOfBirth,
          key: args.key,
        ),
      );
    },
    VerifyConsentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyConsentPage(),
      );
    },
    AgeCheckRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AgeCheckPage(),
      );
    },
    InitialSplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialSplashPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    VideoFeedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VideoFeedPage(),
      );
    },
    ChatRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatRouterPage(),
      );
    },
    ChatMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatMainPage(),
      );
    },
    HomeRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRouterPage(),
      );
    },
    ProfileMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileMainPage(),
      );
    },
    TrainingRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrainingRouterPage(),
      );
    },
    TrainingMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrainingMainPage(),
      );
    },
  };
}

/// generated route for
/// [RatingPage]
class RatingRoute extends PageRouteInfo<void> {
  const RatingRoute({List<PageRouteInfo>? children})
      : super(
          RatingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseProfileTypePage]
class ChooseProfileTypeRoute extends PageRouteInfo<ChooseProfileTypeRouteArgs> {
  ChooseProfileTypeRoute({
    DateTime? dateOfBirth,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChooseProfileTypeRoute.name,
          args: ChooseProfileTypeRouteArgs(
            dateOfBirth: dateOfBirth,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChooseProfileTypeRoute';

  static const PageInfo<ChooseProfileTypeRouteArgs> page =
      PageInfo<ChooseProfileTypeRouteArgs>(name);
}

class ChooseProfileTypeRouteArgs {
  const ChooseProfileTypeRouteArgs({
    this.dateOfBirth,
    this.key,
  });

  final DateTime? dateOfBirth;

  final Key? key;

  @override
  String toString() {
    return 'ChooseProfileTypeRouteArgs{dateOfBirth: $dateOfBirth, key: $key}';
  }
}

/// generated route for
/// [VerifyConsentPage]
class VerifyConsentRoute extends PageRouteInfo<void> {
  const VerifyConsentRoute({List<PageRouteInfo>? children})
      : super(
          VerifyConsentRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyConsentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AgeCheckPage]
class AgeCheckRoute extends PageRouteInfo<void> {
  const AgeCheckRoute({List<PageRouteInfo>? children})
      : super(
          AgeCheckRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgeCheckRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialSplashPage]
class InitialSplashRoute extends PageRouteInfo<void> {
  const InitialSplashRoute({List<PageRouteInfo>? children})
      : super(
          InitialSplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialSplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoFeedPage]
class VideoFeedRoute extends PageRouteInfo<void> {
  const VideoFeedRoute({List<PageRouteInfo>? children})
      : super(
          VideoFeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoFeedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatRouterPage]
class ChatRouter extends PageRouteInfo<void> {
  const ChatRouter({List<PageRouteInfo>? children})
      : super(
          ChatRouter.name,
          initialChildren: children,
        );

  static const String name = 'ChatRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatMainPage]
class ChatMainRoute extends PageRouteInfo<void> {
  const ChatMainRoute({List<PageRouteInfo>? children})
      : super(
          ChatMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeRouterPage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRouterPage]
class ProfileRouter extends PageRouteInfo<void> {
  const ProfileRouter({List<PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileMainPage]
class ProfileMainRoute extends PageRouteInfo<void> {
  const ProfileMainRoute({List<PageRouteInfo>? children})
      : super(
          ProfileMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TrainingRouterPage]
class TrainingRouter extends PageRouteInfo<void> {
  const TrainingRouter({List<PageRouteInfo>? children})
      : super(
          TrainingRouter.name,
          initialChildren: children,
        );

  static const String name = 'TrainingRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TrainingMainPage]
class TrainingMainRoute extends PageRouteInfo<void> {
  const TrainingMainRoute({List<PageRouteInfo>? children})
      : super(
          TrainingMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainingMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
