import 'package:freezed_annotation/freezed_annotation.dart';

part 'followers_info.freezed.dart';

@freezed
class FollowersInfo with _$FollowersInfo {
  const factory FollowersInfo({
    @Default(0) int? followers,
    @Default(0) int? subscriptions,
  }) = _FollowersInfo;
}
