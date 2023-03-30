// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return _AuthenticationResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationResponse {
  ResponseAuthState get authState => throw _privateConstructorUsedError;
  UserProfileType? get profileType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationResponseCopyWith<AuthenticationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationResponseCopyWith<$Res> {
  factory $AuthenticationResponseCopyWith(AuthenticationResponse value,
          $Res Function(AuthenticationResponse) then) =
      _$AuthenticationResponseCopyWithImpl<$Res, AuthenticationResponse>;
  @useResult
  $Res call({ResponseAuthState authState, UserProfileType? profileType});
}

/// @nodoc
class _$AuthenticationResponseCopyWithImpl<$Res,
        $Val extends AuthenticationResponse>
    implements $AuthenticationResponseCopyWith<$Res> {
  _$AuthenticationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = null,
    Object? profileType = freezed,
  }) {
    return _then(_value.copyWith(
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as ResponseAuthState,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as UserProfileType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationResponseCopyWith<$Res>
    implements $AuthenticationResponseCopyWith<$Res> {
  factory _$$_AuthenticationResponseCopyWith(_$_AuthenticationResponse value,
          $Res Function(_$_AuthenticationResponse) then) =
      __$$_AuthenticationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResponseAuthState authState, UserProfileType? profileType});
}

/// @nodoc
class __$$_AuthenticationResponseCopyWithImpl<$Res>
    extends _$AuthenticationResponseCopyWithImpl<$Res,
        _$_AuthenticationResponse>
    implements _$$_AuthenticationResponseCopyWith<$Res> {
  __$$_AuthenticationResponseCopyWithImpl(_$_AuthenticationResponse _value,
      $Res Function(_$_AuthenticationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = null,
    Object? profileType = freezed,
  }) {
    return _then(_$_AuthenticationResponse(
      authState: null == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as ResponseAuthState,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as UserProfileType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthenticationResponse implements _AuthenticationResponse {
  const _$_AuthenticationResponse({required this.authState, this.profileType});

  factory _$_AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticationResponseFromJson(json);

  @override
  final ResponseAuthState authState;
  @override
  final UserProfileType? profileType;

  @override
  String toString() {
    return 'AuthenticationResponse(authState: $authState, profileType: $profileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationResponse &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authState, profileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationResponseCopyWith<_$_AuthenticationResponse> get copyWith =>
      __$$_AuthenticationResponseCopyWithImpl<_$_AuthenticationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticationResponseToJson(
      this,
    );
  }
}

abstract class _AuthenticationResponse implements AuthenticationResponse {
  const factory _AuthenticationResponse(
      {required final ResponseAuthState authState,
      final UserProfileType? profileType}) = _$_AuthenticationResponse;

  factory _AuthenticationResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthenticationResponse.fromJson;

  @override
  ResponseAuthState get authState;
  @override
  UserProfileType? get profileType;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationResponseCopyWith<_$_AuthenticationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
