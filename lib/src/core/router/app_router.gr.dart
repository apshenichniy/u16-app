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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RatingPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatPage(),
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
    TrainingRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrainingRootPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserProfilePage(),
      );
    },
    VideoFeedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VideoFeedPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

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
/// [TrainingRootPage]
class TrainingRootRoute extends PageRouteInfo<void> {
  const TrainingRootRoute({List<PageRouteInfo>? children})
      : super(
          TrainingRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainingRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

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
