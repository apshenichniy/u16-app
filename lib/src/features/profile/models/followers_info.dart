import 'package:freezed_annotation/freezed_annotation.dart';

part 'followers_info.freezed.dart';

@freezed
class FollowersInfo with _$FollowersInfo {
  const factory FollowersInfo({
    required int followers,
    required int followings,
  }) = _FollowersInfo;
}
