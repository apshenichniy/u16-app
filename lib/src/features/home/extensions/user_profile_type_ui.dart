import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/gen/assets.gen.dart';
import 'package:u16/src/l10n/l10n.dart';

extension UserProfileTypeUI on UserProfileType {
  List<PageRouteInfo> get routes {
    switch (this) {
      case UserProfileType.junior:
        return [
          const VideoFeedRoute(),
          const TrainingRouter(),
          const ChatRouter(),
          const ProfileRouter(),
        ];
      case UserProfileType.coach:
        return [
          const VideoFeedRoute(),
          const ChatRouter(),
          const ProfileRouter(),
        ];
      case UserProfileType.scout:
        return [
          const VideoFeedRoute(),
          const ChatRouter(),
          const ProfileRouter(),
        ];
    }
  }

  List<Destinations> get destinations {
    switch (this) {
      case UserProfileType.junior:
        return [
          Destinations.home,
          Destinations.training,
          Destinations.chat,
          Destinations.profile,
        ];
      case UserProfileType.coach:
        return [
          Destinations.home,
          Destinations.chat,
          Destinations.profile,
        ];
      case UserProfileType.scout:
        return [
          Destinations.home,
          Destinations.chat,
          Destinations.profile,
        ];
    }
  }
}

enum Destinations { home, profile, training, rating, chat }

extension DestinationAsset on Destinations {
  String title(BuildContext context) {
    switch (this) {
      case Destinations.home:
        return context.l10n.navBarHome;
      case Destinations.profile:
        return context.l10n.navBarProfile;
      case Destinations.training:
        return context.l10n.navBarTraining;
      case Destinations.rating:
        return context.l10n.navBarRating;
      case Destinations.chat:
        return context.l10n.navBarChat;
    }
  }

  String get iconAsset {
    switch (this) {
      case Destinations.home:
        return Assets.images.home;
      case Destinations.profile:
        return Assets.images.profile;
      case Destinations.training:
        return Assets.images.training;
      case Destinations.rating:
        return Assets.images.rating;
      case Destinations.chat:
        return Assets.images.chat;
    }
  }

  String get selectedIconAsset {
    switch (this) {
      case Destinations.home:
        return Assets.images.homeActive;
      case Destinations.profile:
        return Assets.images.profileActive;
      case Destinations.training:
        return Assets.images.trainingActive;
      case Destinations.rating:
        return Assets.images.ratingActive;
      case Destinations.chat:
        return Assets.images.chatActive;
    }
  }
}
