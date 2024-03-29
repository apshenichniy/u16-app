// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() ageCheckRequired,
    required TResult Function() waitingForConsent,
    required TResult Function() userProfileRequired,
    required TResult Function(UserProfileType profileType) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? ageCheckRequired,
    TResult? Function()? waitingForConsent,
    TResult? Function()? userProfileRequired,
    TResult? Function(UserProfileType profileType)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? ageCheckRequired,
    TResult Function()? waitingForConsent,
    TResult Function()? userProfileRequired,
    TResult Function(UserProfileType profileType)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_AgeCheckRequired value) ageCheckRequired,
    required TResult Function(_WaitingForConsent value) waitingForConsent,
    required TResult Function(_UserProfileRequired value) userProfileRequired,
    required TResult Function(_Authenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult? Function(_WaitingForConsent value)? waitingForConsent,
    TResult? Function(_UserProfileRequired value)? userProfileRequired,
    TResult? Function(_Authenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult Function(_WaitingForConsent value)? waitingForConsent,
    TResult Function(_UserProfileRequired value)? userProfileRequired,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnauthenticatedCopyWith<$Res> {
  factory _$$_UnauthenticatedCopyWith(
          _$_Unauthenticated value, $Res Function(_$_Unauthenticated) then) =
      __$$_UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Unauthenticated>
    implements _$$_UnauthenticatedCopyWith<$Res> {
  __$$_UnauthenticatedCopyWithImpl(
      _$_Unauthenticated _value, $Res Function(_$_Unauthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() ageCheckRequired,
    required TResult Function() waitingForConsent,
    required TResult Function() userProfileRequired,
    required TResult Function(UserProfileType profileType) authenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? ageCheckRequired,
    TResult? Function()? waitingForConsent,
    TResult? Function()? userProfileRequired,
    TResult? Function(UserProfileType profileType)? authenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? ageCheckRequired,
    TResult Function()? waitingForConsent,
    TResult Function()? userProfileRequired,
    TResult Function(UserProfileType profileType)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_AgeCheckRequired value) ageCheckRequired,
    required TResult Function(_WaitingForConsent value) waitingForConsent,
    required TResult Function(_UserProfileRequired value) userProfileRequired,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult? Function(_WaitingForConsent value)? waitingForConsent,
    TResult? Function(_UserProfileRequired value)? userProfileRequired,
    TResult? Function(_Authenticated value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult Function(_WaitingForConsent value)? waitingForConsent,
    TResult Function(_UserProfileRequired value)? userProfileRequired,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthenticationState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

/// @nodoc
abstract class _$$_AgeCheckRequiredCopyWith<$Res> {
  factory _$$_AgeCheckRequiredCopyWith(
          _$_AgeCheckRequired value, $Res Function(_$_AgeCheckRequired) then) =
      __$$_AgeCheckRequiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AgeCheckRequiredCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_AgeCheckRequired>
    implements _$$_AgeCheckRequiredCopyWith<$Res> {
  __$$_AgeCheckRequiredCopyWithImpl(
      _$_AgeCheckRequired _value, $Res Function(_$_AgeCheckRequired) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AgeCheckRequired implements _AgeCheckRequired {
  const _$_AgeCheckRequired();

  @override
  String toString() {
    return 'AuthenticationState.ageCheckRequired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AgeCheckRequired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() ageCheckRequired,
    required TResult Function() waitingForConsent,
    required TResult Function() userProfileRequired,
    required TResult Function(UserProfileType profileType) authenticated,
  }) {
    return ageCheckRequired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? ageCheckRequired,
    TResult? Function()? waitingForConsent,
    TResult? Function()? userProfileRequired,
    TResult? Function(UserProfileType profileType)? authenticated,
  }) {
    return ageCheckRequired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? ageCheckRequired,
    TResult Function()? waitingForConsent,
    TResult Function()? userProfileRequired,
    TResult Function(UserProfileType profileType)? authenticated,
    required TResult orElse(),
  }) {
    if (ageCheckRequired != null) {
      return ageCheckRequired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_AgeCheckRequired value) ageCheckRequired,
    required TResult Function(_WaitingForConsent value) waitingForConsent,
    required TResult Function(_UserProfileRequired value) userProfileRequired,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return ageCheckRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult? Function(_WaitingForConsent value)? waitingForConsent,
    TResult? Function(_UserProfileRequired value)? userProfileRequired,
    TResult? Function(_Authenticated value)? authenticated,
  }) {
    return ageCheckRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult Function(_WaitingForConsent value)? waitingForConsent,
    TResult Function(_UserProfileRequired value)? userProfileRequired,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (ageCheckRequired != null) {
      return ageCheckRequired(this);
    }
    return orElse();
  }
}

abstract class _AgeCheckRequired implements AuthenticationState {
  const factory _AgeCheckRequired() = _$_AgeCheckRequired;
}

/// @nodoc
abstract class _$$_WaitingForConsentCopyWith<$Res> {
  factory _$$_WaitingForConsentCopyWith(_$_WaitingForConsent value,
          $Res Function(_$_WaitingForConsent) then) =
      __$$_WaitingForConsentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WaitingForConsentCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_WaitingForConsent>
    implements _$$_WaitingForConsentCopyWith<$Res> {
  __$$_WaitingForConsentCopyWithImpl(
      _$_WaitingForConsent _value, $Res Function(_$_WaitingForConsent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_WaitingForConsent implements _WaitingForConsent {
  const _$_WaitingForConsent();

  @override
  String toString() {
    return 'AuthenticationState.waitingForConsent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_WaitingForConsent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() ageCheckRequired,
    required TResult Function() waitingForConsent,
    required TResult Function() userProfileRequired,
    required TResult Function(UserProfileType profileType) authenticated,
  }) {
    return waitingForConsent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? ageCheckRequired,
    TResult? Function()? waitingForConsent,
    TResult? Function()? userProfileRequired,
    TResult? Function(UserProfileType profileType)? authenticated,
  }) {
    return waitingForConsent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? ageCheckRequired,
    TResult Function()? waitingForConsent,
    TResult Function()? userProfileRequired,
    TResult Function(UserProfileType profileType)? authenticated,
    required TResult orElse(),
  }) {
    if (waitingForConsent != null) {
      return waitingForConsent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_AgeCheckRequired value) ageCheckRequired,
    required TResult Function(_WaitingForConsent value) waitingForConsent,
    required TResult Function(_UserProfileRequired value) userProfileRequired,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return waitingForConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult? Function(_WaitingForConsent value)? waitingForConsent,
    TResult? Function(_UserProfileRequired value)? userProfileRequired,
    TResult? Function(_Authenticated value)? authenticated,
  }) {
    return waitingForConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult Function(_WaitingForConsent value)? waitingForConsent,
    TResult Function(_UserProfileRequired value)? userProfileRequired,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (waitingForConsent != null) {
      return waitingForConsent(this);
    }
    return orElse();
  }
}

abstract class _WaitingForConsent implements AuthenticationState {
  const factory _WaitingForConsent() = _$_WaitingForConsent;
}

/// @nodoc
abstract class _$$_UserProfileRequiredCopyWith<$Res> {
  factory _$$_UserProfileRequiredCopyWith(_$_UserProfileRequired value,
          $Res Function(_$_UserProfileRequired) then) =
      __$$_UserProfileRequiredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserProfileRequiredCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_UserProfileRequired>
    implements _$$_UserProfileRequiredCopyWith<$Res> {
  __$$_UserProfileRequiredCopyWithImpl(_$_UserProfileRequired _value,
      $Res Function(_$_UserProfileRequired) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserProfileRequired implements _UserProfileRequired {
  const _$_UserProfileRequired();

  @override
  String toString() {
    return 'AuthenticationState.userProfileRequired()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserProfileRequired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() ageCheckRequired,
    required TResult Function() waitingForConsent,
    required TResult Function() userProfileRequired,
    required TResult Function(UserProfileType profileType) authenticated,
  }) {
    return userProfileRequired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? ageCheckRequired,
    TResult? Function()? waitingForConsent,
    TResult? Function()? userProfileRequired,
    TResult? Function(UserProfileType profileType)? authenticated,
  }) {
    return userProfileRequired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? ageCheckRequired,
    TResult Function()? waitingForConsent,
    TResult Function()? userProfileRequired,
    TResult Function(UserProfileType profileType)? authenticated,
    required TResult orElse(),
  }) {
    if (userProfileRequired != null) {
      return userProfileRequired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_AgeCheckRequired value) ageCheckRequired,
    required TResult Function(_WaitingForConsent value) waitingForConsent,
    required TResult Function(_UserProfileRequired value) userProfileRequired,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return userProfileRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult? Function(_WaitingForConsent value)? waitingForConsent,
    TResult? Function(_UserProfileRequired value)? userProfileRequired,
    TResult? Function(_Authenticated value)? authenticated,
  }) {
    return userProfileRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult Function(_WaitingForConsent value)? waitingForConsent,
    TResult Function(_UserProfileRequired value)? userProfileRequired,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (userProfileRequired != null) {
      return userProfileRequired(this);
    }
    return orElse();
  }
}

abstract class _UserProfileRequired implements AuthenticationState {
  const factory _UserProfileRequired() = _$_UserProfileRequired;
}

/// @nodoc
abstract class _$$_AuthenticatedCopyWith<$Res> {
  factory _$$_AuthenticatedCopyWith(
          _$_Authenticated value, $Res Function(_$_Authenticated) then) =
      __$$_AuthenticatedCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileType profileType});
}

/// @nodoc
class __$$_AuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_Authenticated>
    implements _$$_AuthenticatedCopyWith<$Res> {
  __$$_AuthenticatedCopyWithImpl(
      _$_Authenticated _value, $Res Function(_$_Authenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileType = null,
  }) {
    return _then(_$_Authenticated(
      null == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as UserProfileType,
    ));
  }
}

/// @nodoc

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated(this.profileType);

  @override
  final UserProfileType profileType;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(profileType: $profileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Authenticated &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedCopyWith<_$_Authenticated> get copyWith =>
      __$$_AuthenticatedCopyWithImpl<_$_Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() ageCheckRequired,
    required TResult Function() waitingForConsent,
    required TResult Function() userProfileRequired,
    required TResult Function(UserProfileType profileType) authenticated,
  }) {
    return authenticated(profileType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function()? ageCheckRequired,
    TResult? Function()? waitingForConsent,
    TResult? Function()? userProfileRequired,
    TResult? Function(UserProfileType profileType)? authenticated,
  }) {
    return authenticated?.call(profileType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? ageCheckRequired,
    TResult Function()? waitingForConsent,
    TResult Function()? userProfileRequired,
    TResult Function(UserProfileType profileType)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(profileType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_AgeCheckRequired value) ageCheckRequired,
    required TResult Function(_WaitingForConsent value) waitingForConsent,
    required TResult Function(_UserProfileRequired value) userProfileRequired,
    required TResult Function(_Authenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult? Function(_WaitingForConsent value)? waitingForConsent,
    TResult? Function(_UserProfileRequired value)? userProfileRequired,
    TResult? Function(_Authenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_AgeCheckRequired value)? ageCheckRequired,
    TResult Function(_WaitingForConsent value)? waitingForConsent,
    TResult Function(_UserProfileRequired value)? userProfileRequired,
    TResult Function(_Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthenticationState {
  const factory _Authenticated(final UserProfileType profileType) =
      _$_Authenticated;

  UserProfileType get profileType;
  @JsonKey(ignore: true)
  _$$_AuthenticatedCopyWith<_$_Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}
