// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username_availability_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsernameAvailabilityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String username) available,
    required TResult Function() alreadyRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username)? available,
    TResult? Function()? alreadyRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username)? available,
    TResult Function()? alreadyRegistered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Available value) available,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Available value)? available,
    TResult? Function(_AlreadyRegistered value)? alreadyRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Available value)? available,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameAvailabilityStateCopyWith<$Res> {
  factory $UsernameAvailabilityStateCopyWith(UsernameAvailabilityState value,
          $Res Function(UsernameAvailabilityState) then) =
      _$UsernameAvailabilityStateCopyWithImpl<$Res, UsernameAvailabilityState>;
}

/// @nodoc
class _$UsernameAvailabilityStateCopyWithImpl<$Res,
        $Val extends UsernameAvailabilityState>
    implements $UsernameAvailabilityStateCopyWith<$Res> {
  _$UsernameAvailabilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$UsernameAvailabilityStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'UsernameAvailabilityState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String username) available,
    required TResult Function() alreadyRegistered,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username)? available,
    TResult? Function()? alreadyRegistered,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username)? available,
    TResult Function()? alreadyRegistered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Available value) available,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Available value)? available,
    TResult? Function(_AlreadyRegistered value)? alreadyRegistered,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Available value)? available,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UsernameAvailabilityState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AvailableCopyWith<$Res> {
  factory _$$_AvailableCopyWith(
          _$_Available value, $Res Function(_$_Available) then) =
      __$$_AvailableCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$_AvailableCopyWithImpl<$Res>
    extends _$UsernameAvailabilityStateCopyWithImpl<$Res, _$_Available>
    implements _$$_AvailableCopyWith<$Res> {
  __$$_AvailableCopyWithImpl(
      _$_Available _value, $Res Function(_$_Available) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$_Available(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Available implements _Available {
  const _$_Available({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'UsernameAvailabilityState.available(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Available &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableCopyWith<_$_Available> get copyWith =>
      __$$_AvailableCopyWithImpl<_$_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String username) available,
    required TResult Function() alreadyRegistered,
  }) {
    return available(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username)? available,
    TResult? Function()? alreadyRegistered,
  }) {
    return available?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username)? available,
    TResult Function()? alreadyRegistered,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Available value) available,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Available value)? available,
    TResult? Function(_AlreadyRegistered value)? alreadyRegistered,
  }) {
    return available?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Available value)? available,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements UsernameAvailabilityState {
  const factory _Available({required final String username}) = _$_Available;

  String get username;
  @JsonKey(ignore: true)
  _$$_AvailableCopyWith<_$_Available> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AlreadyRegisteredCopyWith<$Res> {
  factory _$$_AlreadyRegisteredCopyWith(_$_AlreadyRegistered value,
          $Res Function(_$_AlreadyRegistered) then) =
      __$$_AlreadyRegisteredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AlreadyRegisteredCopyWithImpl<$Res>
    extends _$UsernameAvailabilityStateCopyWithImpl<$Res, _$_AlreadyRegistered>
    implements _$$_AlreadyRegisteredCopyWith<$Res> {
  __$$_AlreadyRegisteredCopyWithImpl(
      _$_AlreadyRegistered _value, $Res Function(_$_AlreadyRegistered) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AlreadyRegistered implements _AlreadyRegistered {
  const _$_AlreadyRegistered();

  @override
  String toString() {
    return 'UsernameAvailabilityState.alreadyRegistered()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AlreadyRegistered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String username) available,
    required TResult Function() alreadyRegistered,
  }) {
    return alreadyRegistered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String username)? available,
    TResult? Function()? alreadyRegistered,
  }) {
    return alreadyRegistered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String username)? available,
    TResult Function()? alreadyRegistered,
    required TResult orElse(),
  }) {
    if (alreadyRegistered != null) {
      return alreadyRegistered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Available value) available,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
  }) {
    return alreadyRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Available value)? available,
    TResult? Function(_AlreadyRegistered value)? alreadyRegistered,
  }) {
    return alreadyRegistered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Available value)? available,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    required TResult orElse(),
  }) {
    if (alreadyRegistered != null) {
      return alreadyRegistered(this);
    }
    return orElse();
  }
}

abstract class _AlreadyRegistered implements UsernameAvailabilityState {
  const factory _AlreadyRegistered() = _$_AlreadyRegistered;
}
