// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followers_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowersInfo {
  int get followers => throw _privateConstructorUsedError;
  int get followings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowersInfoCopyWith<FollowersInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersInfoCopyWith<$Res> {
  factory $FollowersInfoCopyWith(
          FollowersInfo value, $Res Function(FollowersInfo) then) =
      _$FollowersInfoCopyWithImpl<$Res, FollowersInfo>;
  @useResult
  $Res call({int followers, int followings});
}

/// @nodoc
class _$FollowersInfoCopyWithImpl<$Res, $Val extends FollowersInfo>
    implements $FollowersInfoCopyWith<$Res> {
  _$FollowersInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
    Object? followings = null,
  }) {
    return _then(_value.copyWith(
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      followings: null == followings
          ? _value.followings
          : followings // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FollowersInfoCopyWith<$Res>
    implements $FollowersInfoCopyWith<$Res> {
  factory _$$_FollowersInfoCopyWith(
          _$_FollowersInfo value, $Res Function(_$_FollowersInfo) then) =
      __$$_FollowersInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int followers, int followings});
}

/// @nodoc
class __$$_FollowersInfoCopyWithImpl<$Res>
    extends _$FollowersInfoCopyWithImpl<$Res, _$_FollowersInfo>
    implements _$$_FollowersInfoCopyWith<$Res> {
  __$$_FollowersInfoCopyWithImpl(
      _$_FollowersInfo _value, $Res Function(_$_FollowersInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followers = null,
    Object? followings = null,
  }) {
    return _then(_$_FollowersInfo(
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      followings: null == followings
          ? _value.followings
          : followings // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FollowersInfo implements _FollowersInfo {
  const _$_FollowersInfo({required this.followers, required this.followings});

  @override
  final int followers;
  @override
  final int followings;

  @override
  String toString() {
    return 'FollowersInfo(followers: $followers, followings: $followings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowersInfo &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.followings, followings) ||
                other.followings == followings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, followers, followings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowersInfoCopyWith<_$_FollowersInfo> get copyWith =>
      __$$_FollowersInfoCopyWithImpl<_$_FollowersInfo>(this, _$identity);
}

abstract class _FollowersInfo implements FollowersInfo {
  const factory _FollowersInfo(
      {required final int followers,
      required final int followings}) = _$_FollowersInfo;

  @override
  int get followers;
  @override
  int get followings;
  @override
  @JsonKey(ignore: true)
  _$$_FollowersInfoCopyWith<_$_FollowersInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
