import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/chat/chat.dart';
import 'package:u16/src/features/feed/feed.dart';
import 'package:u16/src/features/home/home.dart';
import 'package:u16/src/features/profile/profile.dart';
import 'package:u16/src/features/rating/rating.dart';
import 'package:u16/src/features/training/training.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    //AutoRoute(page: DemoSplashRoute.page, path: '/'),

    AutoRoute(page: InitialSplashRoute.page, path: '/'),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: AgeCheckRoute.page),
    AutoRoute(page: VerifyConsentRoute.page),
    AutoRoute(page: ChooseProfileTypeRoute.page),
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      children: [
        AutoRoute(page: VideoFeedRoute.page),
        AutoRoute(page: TrainingRootRoute.page),
        AutoRoute(page: RatingRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: UserProfileRoute.page),
      ],
    ),
  ];
}

@riverpod
// ignore: unsupported_provider_value
AppRouter router(RouterRef ref) => AppRouter();
