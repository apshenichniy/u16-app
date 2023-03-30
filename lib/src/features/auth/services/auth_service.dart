import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'auth_service.freezed.dart';
part 'auth_service.g.dart';

class AuthService {
  AuthService({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;
  final SupabaseClient _supabaseClient;

  Future<void> signUpWithPassword({
    required String email,
    required String password,
  }) async {
    await _supabaseClient.auth.signUp(email: email, password: password);
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await _supabaseClient.auth
        .signInWithPassword(email: email, password: password);
  }

  Future<void> signInWithApple() async {
    await _supabaseClient.auth
        .signInWithPassword(email: 'user1@user.dev', password: 'user1pass');
  }

  Future<void> signInWithGoogle() async {
    throw UnimplementedError();
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  FutureOr<AuthenticationState> authenticate() async {
    if (_supabaseClient.auth.currentUser == null) {
      return const AuthenticationState.unauthenticated();
    }

    final response = await _supabaseClient.functions.invoke(
      'authenticate',
      body: {},
    );

    if (response.status != 200) {
      throw Exception(response.data);
    }

    final authenticationResponse =
        AuthenticationResponse.fromJson(response.data as Map<String, dynamic>);

    switch (authenticationResponse.authState) {
      case ResponseAuthState.ageCheckRequired:
        return const AuthenticationState.ageCheckRequired();
      case ResponseAuthState.waitingForConsent:
        return const AuthenticationState.waitingForConsent();
      case ResponseAuthState.userProfileRequired:
        return const AuthenticationState.userProfileRequired();
      case ResponseAuthState.authenticated:
        return AuthenticationState.authenticated(
          authenticationResponse.profileType!,
        );
      case ResponseAuthState.unauthenticated:
        return const AuthenticationState.unauthenticated();
    }
  }

  Future<void> createConsentRequest({
    required String email,
    required DateTime dateOfBirth,
  }) async {
    await _supabaseClient.functions.invoke(
      'create-consent-request',
      body: {
        'email': email,
        'dateOfBirth': dateOfBirth.toIso8601String(),
      },
    );
  }

  Future<bool> verifyConsentRequest({required String code}) async {
    final response = await _supabaseClient.functions
        .invoke('verify-consent-request', body: {'code': code});

    return response.data.toString().parseBool();
  }
}

@riverpod
AuthService authService(AuthServiceRef ref) => AuthService(
      supabaseClient: ref.read(supabaseClientProvider),
    );

enum ResponseAuthState {
  ageCheckRequired,
  waitingForConsent,
  userProfileRequired,
  authenticated,
  unauthenticated,
}

@freezed
class AuthenticationResponse with _$AuthenticationResponse {
  const factory AuthenticationResponse({
    required ResponseAuthState authState,
    UserProfileType? profileType,
  }) = _AuthenticationResponse;

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
}
