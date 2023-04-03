/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $EnvGen {
  const $EnvGen();

  /// File path: .env/.env
  String get env => '.env/.env';

  /// List of all assets
  List<String> get values => [env];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple_icon.svg
  String get appleIcon => 'assets/images/apple_icon.svg';

  /// File path: assets/images/chat.svg
  String get chat => 'assets/images/chat.svg';

  /// File path: assets/images/chat_active.svg
  String get chatActive => 'assets/images/chat_active.svg';

  /// File path: assets/images/coach_profile_type.svg
  String get coachProfileType => 'assets/images/coach_profile_type.svg';

  /// File path: assets/images/collection_tab_icon.svg
  String get collectionTabIcon => 'assets/images/collection_tab_icon.svg';

  /// File path: assets/images/days_streak.svg
  String get daysStreak => 'assets/images/days_streak.svg';

  /// File path: assets/images/edit_icon.svg
  String get editIcon => 'assets/images/edit_icon.svg';

  /// File path: assets/images/google_icon.svg
  String get googleIcon => 'assets/images/google_icon.svg';

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/home_active.svg
  String get homeActive => 'assets/images/home_active.svg';

  /// File path: assets/images/junior_profile_type.svg
  String get juniorProfileType => 'assets/images/junior_profile_type.svg';

  /// File path: assets/images/not_found_error.svg
  String get notFoundError => 'assets/images/not_found_error.svg';

  /// File path: assets/images/notifications_tab_icon.svg
  String get notificationsTabIcon => 'assets/images/notifications_tab_icon.svg';

  /// File path: assets/images/personal_details_tab_icon.svg
  String get personalDetailsTabIcon =>
      'assets/images/personal_details_tab_icon.svg';

  /// File path: assets/images/profile.svg
  String get profile => 'assets/images/profile.svg';

  /// File path: assets/images/profile_active.svg
  String get profileActive => 'assets/images/profile_active.svg';

  /// File path: assets/images/rating.svg
  String get rating => 'assets/images/rating.svg';

  /// File path: assets/images/rating_active.svg
  String get ratingActive => 'assets/images/rating_active.svg';

  /// File path: assets/images/scout_profile_type.svg
  String get scoutProfileType => 'assets/images/scout_profile_type.svg';

  /// File path: assets/images/soccer_art.svg
  String get soccerArt => 'assets/images/soccer_art.svg';

  /// File path: assets/images/team_tab_icon.svg
  String get teamTabIcon => 'assets/images/team_tab_icon.svg';

  /// File path: assets/images/training.svg
  String get training => 'assets/images/training.svg';

  /// File path: assets/images/training_active.svg
  String get trainingActive => 'assets/images/training_active.svg';

  /// File path: assets/images/video_tab_icon.svg
  String get videoTabIcon => 'assets/images/video_tab_icon.svg';

  /// List of all assets
  List<String> get values => [
        appleIcon,
        chat,
        chatActive,
        coachProfileType,
        collectionTabIcon,
        daysStreak,
        editIcon,
        googleIcon,
        home,
        homeActive,
        juniorProfileType,
        notFoundError,
        notificationsTabIcon,
        personalDetailsTabIcon,
        profile,
        profileActive,
        rating,
        ratingActive,
        scoutProfileType,
        soccerArt,
        teamTabIcon,
        training,
        trainingActive,
        videoTabIcon
      ];
}

class Assets {
  Assets._();

  static const $EnvGen env = $EnvGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
