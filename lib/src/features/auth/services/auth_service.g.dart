// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticationResponse _$$_AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticationResponse(
      authState: $enumDecode(_$ResponseAuthStateEnumMap, json['auth_state']),
      profileType:
          $enumDecodeNullable(_$UserProfileTypeEnumMap, json['profile_type']),
    );

Map<String, dynamic> _$$_AuthenticationResponseToJson(
        _$_AuthenticationResponse instance) =>
    <String, dynamic>{
      'auth_state': _$ResponseAuthStateEnumMap[instance.authState]!,
      'profile_type': _$UserProfileTypeEnumMap[instance.profileType],
    };

const _$ResponseAuthStateEnumMap = {
  ResponseAuthState.ageCheckRequired: 'ageCheckRequired',
  ResponseAuthState.waitingForConsent: 'waitingForConsent',
  ResponseAuthState.userProfileRequired: 'userProfileRequired',
  ResponseAuthState.authenticated: 'authenticated',
  ResponseAuthState.unauthenticated: 'unauthenticated',
};

const _$UserProfileTypeEnumMap = {
  UserProfileType.junior: 'junior',
  UserProfileType.coach: 'coach',
  UserProfileType.scout: 'scout',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServiceHash() => r'5cb2cb62e37163dc8004cf1a1b64c364834154b9';

/// See also [authService].
@ProviderFor(authService)
final authServiceProvider = AutoDisposeProvider<AuthService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthServiceRef = AutoDisposeProviderRef<AuthService>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
