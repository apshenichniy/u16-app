import 'package:flutter/material.dart';
import 'package:u16/src/gen/assets.gen.dart';
import 'package:u16/src/l10n/l10n.dart';

enum UserProfileType { junior, coach, scout }

extension UserProfileTypeUI on UserProfileType {
  String get assetName {
    switch (this) {
      case UserProfileType.junior:
        return Assets.images.juniorProfileType;
      case UserProfileType.coach:
        return Assets.images.coachProfileType;
      case UserProfileType.scout:
        return Assets.images.scoutProfileType;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case UserProfileType.junior:
        return context.l10n.userProfileTypeJunior;
      case UserProfileType.coach:
        return context.l10n.userProfileTypeCoach;
      case UserProfileType.scout:
        return context.l10n.userProfileTypeScout;
    }
  }
}
