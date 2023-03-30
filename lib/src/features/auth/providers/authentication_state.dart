part of 'authentication_controller.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.ageCheckRequired() = _AgeCheckRequired;
  const factory AuthenticationState.waitingForConsent() = _WaitingForConsent;
  const factory AuthenticationState.userProfileRequired() =
      _UserProfileRequired;
  const factory AuthenticationState.authenticated(UserProfileType profileType) =
      _Authenticated;
}
